// prod - dev
provider "aws" {
  region                  = "ap-northeast-2"
  profile                 = "22shop"
  shared_credentials_file = "C:/Users/aa/.aws/credentials"
  #4.x버전의 AWS공급자 허용
  version = "~> 4.0"

}

locals {
  common_tags = {
    project = "22shop"
    owner   = "icurfer"

  }
  tcp_port = {
    # any_port    = 0
    http_port   = 80
    https_port  = 443
    ssh_port    = 22
    dns_port    = 53
    django_port = 8000
    mysql_port  = 3306
  }
  udp_port = {
    dns_port = 53
  }
  any_protocol  = "-1"
  tcp_protocol  = "tcp"
  icmp_protocol = "icmp"
  all_ips       = ["0.0.0.0/0"]
}

// GET 계정정보
data "aws_caller_identity" "this" {}

// 테라폼클라우드
data "terraform_remote_state" "jenkins" {
  backend = "remote"

  config = {
    organization = "22shop"

    workspaces = {
      name = "web-jenkins-sdjo"
    }
  }
}

locals {
  # dns_name = "777aws.ml"
  dns_name = "ddochi.me"
}

module "rote53" {
  source = "../modules/route53"
  name   = local.dns_name
}

resource "aws_route53_record" "www" {
  zone_id = module.rote53.zone_id
  name    = "jenkins.ddochi.me"
  type    = "A"
  ttl = 300
  records = ["${data.terraform_remote_state.jenkins.outputs.public_ip}"]
}