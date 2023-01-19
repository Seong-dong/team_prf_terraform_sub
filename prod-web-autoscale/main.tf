// prod - dev
provider "aws" {
  region                  = "ap-northeast-2"
  profile                 = "22shop"
  # shared_credentials_file = "C:/Users/aa/.aws/credentials"
  shared_credentials_file = "~/.aws/credentials"
  #4.x버전의 AWS공급자 허용
  version = "~> 4.0"

}


// GET 계정정보
data "aws_caller_identity" "this" {}
// 테라폼클라우드
data "terraform_remote_state" "web-network-sdjo" {
  backend = "remote"

  config = {
    organization = "22shop"

    workspaces = {
      name = "web-network-sdjo" # <-테라폼클라우드 네임
    }
  }
}
# data "template_file" "user_data" {
#     template = file("${path.module}/asg-user-data.sh")
#     // path.module은 root모듈 main 파일에서 module호출시 source에 입력한 경로를 따라감.

#     # vars = {
#     #     server_port = var.set_ports.http
#     #     db_address = data.terraform_remote_state.db.outputs.address
#     #     db_port = data.terraform_remote_state.db.outputs.port
#     # }
# }
locals {
  account_id     = data.aws_caller_identity.this.account_id
  key_name       = "default-shop"
  vpc_id         = data.terraform_remote_state.web-network-sdjo.outputs.vpc_id
  private_subnet = data.terraform_remote_state.web-network-sdjo.outputs.private_subnet
  public_subnet  = data.terraform_remote_state.web-network-sdjo.outputs.public_subnet
  common_tags = {
    project = "22shop"
    owner   = "sdjo"

  }
  ec2_sg-ingress_port = {
    # any_port    = 0
    http_port    = 80
    https_port   = 443
    ssh_port     = 22
    # any_protocol = "-1" #icmp
    # dns_port    = 53
    # django_port = 8000
    mysql_port = 3306
  }
  alb_sg-ingress_port = {
    # any_port    = 0
    http_port  = 80
    https_port = 443
    # any_protocol  = "-1" #icmp
    # dns_port    = 53
    # django_port = 8000
    mysql_port = 3306
  }
  udp_port = {
    dns_port = 53
  }
  any_protocol  = "-1"
  tcp_protocol  = "tcp"
  icmp_protocol = "icmp"
  all_ips       = ["0.0.0.0/0"]
  ami_amazon    = "ami-0eddbd81024d3fbdd"
  ami_ununtu    = "ami-0d19691dd2d866cb6" #ubuntu v18.04
  cluster_name  = "web-asg"
  instance_type = "t3.medium"
}

# SG 생성
// EC2 security group
module "ec2_sg" {
  source  = "../modules/sg"
  sg_name = "${local.common_tags.project}-sg"
  vpc_id  = local.vpc_id
}
module "ec2_sg_ingress_http" {
  for_each          = local.ec2_sg-ingress_port
  source            = "../modules/sg-rule-add"
  type              = "ingress"
  from_port         = each.value
  to_port           = each.value
  protocol          = local.tcp_protocol
  cidr_blocks       = local.all_ips
  security_group_id = module.ec2_sg.sg_id

  tag_name = each.key
}

module "ec2_sg_egress_all" {
  source            = "../modules/sg-rule-add"
  type              = "egress"
  from_port         = local.any_protocol
  to_port           = local.any_protocol
  protocol          = local.any_protocol
  cidr_blocks       = local.all_ips
  security_group_id = module.ec2_sg.sg_id

  tag_name = "egress-all"
}
// ALB 보안그룹 생성
module "alb_sg" {
  source  = "../modules/sg"
  sg_name = "${local.common_tags.project}-web-alb-sg"
  vpc_id  = local.vpc_id
}
module "alb_sg_ingress_http" {
  for_each          = local.alb_sg-ingress_port
  source            = "../modules/sg-rule-add"
  type              = "ingress"
  from_port         = each.value
  to_port           = each.value
  protocol          = local.tcp_protocol
  cidr_blocks       = local.all_ips
  security_group_id = module.alb_sg.sg_id

  tag_name = each.key
}

module "alb_sg_egress_all" {
  source            = "../modules/sg-rule-add"
  type              = "egress"
  from_port         = local.any_protocol
  to_port           = local.any_protocol
  protocol          = local.any_protocol
  cidr_blocks       = local.all_ips
  security_group_id = module.alb_sg.sg_id

  tag_name = "egress-all"
}

// ASCG_시작구성
module "ec2_launch_conf" {
  source = "../modules/ec2_launch_conf"

  cluster_name  = local.cluster_name
  ami_id        = local.ami_amazon
  instance_type = local.instance_type
  key_name      = local.key_name
  sg_ids        = [module.ec2_sg.sg_id]
  user_data     = file("../modules/ec2_launch_conf/asg-data.sh")

  depends_on = [
    module.ec2_sg
  ]
}
// ASCG 생성
module "ascg" {
  source           = "../modules/ascg"
  cluster_name     = local.cluster_name
  launch_conf_name = module.ec2_launch_conf.launch_conf_name
  subnet_ids       = [local.private_subnet.zone-a.id, local.private_subnet.zone-c.id]
  alb_tg_arns      = [module.alb.alb_tg_arn]

  desired_capacity = 2
  min_size         = 2
  max_size         = 4
  #로드밸런서 타겟그룹의존
  depends_on = [
    module.alb
  ]

}
// ASCG_SCHEDULE-Business_houre
module "ascg_schedule_business" {
  source           = "../modules/ascg-schedule"
  schedule_name    = "business"
  desired_capacity = 4
  min_size         = 2
  max_size         = 6

  recurrence = "0 9 * * *"
  ascg_name  = module.ascg.ascg_name
}
// ASCG_SCHEDULE-Night_time
module "ascg_schedule_night" {
  source           = "../modules/ascg-schedule"
  schedule_name    = "night"
  desired_capacity = 2
  min_size         = 2
  max_size         = 6

  recurrence = "0 17 * * *"
  ascg_name  = module.ascg.ascg_name
}
// ALB
module "alb" {
  source       = "../modules/alb"
  cluster_name = local.cluster_name
  subnet_ids   = [local.public_subnet.zone-a.id, local.public_subnet.zone-c.id]
  sg_ids       = [module.alb_sg.sg_id]
  vpc_id       = local.vpc_id

  depends_on = [
    module.alb_sg
  ]
}
// Cloudwatch-Alert high_CPU
module "cloudwatch_alert_cpu" {
  source       = "../modules/cloudwatch-metric-alarm"
  cluster_name = local.cluster_name
  ascg_name    = module.ascg.ascg_name
  instance_type = local.instance_type
  depends_on = [
    module.ascg
  ]
}
# // Cloudwatch-Alert low_cpu
# module "cloudwatch_alert_low_cpu" {
#   source = "../modules/cloudwatch-metric-alarm"
# }
