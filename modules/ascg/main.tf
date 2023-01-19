#오토스케일링
resource "aws_autoscaling_group" "ascg" {
  // name = "${var.cluster_name}-asg"
  name                 = "${var.cluster_name}-${var.launch_conf_name}"
  launch_configuration = var.launch_conf_name
  # vpc_zone_identifier = data.aws_subnet_ids.default.ids
  vpc_zone_identifier = var.subnet_ids
  #로드밸런서 타겟그룹 등록
  target_group_arns = var.alb_tg_arns
#   [aws_lb_target_group.alb-tg.arn]
  health_check_type = "ELB"

  #시작시 ec2수량 지정
  desired_capacity = var.desired_capacity

  min_size = var.min_size
  max_size = var.max_size

  tag {
    key                 = "Name"
    value               = "${var.cluster_name}-asg"
    propagate_at_launch = true
  } 

  # dynamic "tag"{
  #   # for_each = var.custom_tags
  #   for_each = {
  #     for key, value in var.custom_tags : key => upper(value)
  #     if key != "Describe"
  #   }

  #   content {
  #     key = tag.key
  #     value = tag.value
  #     propagate_at_launch = true
  #   }
  # }

  // 리소스 생성 후 이전 리소스 삭제 true
  lifecycle {
    create_before_destroy = true
  }

}
