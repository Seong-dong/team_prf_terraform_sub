#로드밸런서
resource "aws_lb" "alb" {
    name = "${var.cluster_name}-alb" 
    load_balancer_type = "application"
    subnets = var.subnet_ids
    security_groups = var.sg_ids
}
# ALB LISTENER
resource "aws_lb_listener" "http" {
    load_balancer_arn = aws_lb.alb.arn
    port = "80"
    protocol = "HTTP"

    default_action {
        type = "fixed-response"

        fixed_response {
            content_type = "text/plain"
            message_body = "404:page not found, err bad request"
            status_code = 404
        }
    }
}
# ALB Listener rule
resource "aws_lb_listener_rule" "alb-lsn-rule" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 100

  condition {
    path_pattern {
      values = ["*"]
    }
    # field = "path-pattern"
    # values = ["*"]
  }

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb-tg.arn
  }
  depends_on = [
    aws_lb_listener.http
  ]
}
# ALB TARGET GROUP
resource "aws_lb_target_group" "alb-tg" {
  name     = "${var.cluster_name}-alb-tg"
  port     = "80"
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path = "/"
    protocol = "HTTP"
    matcher = "200"
    interval = 15 #15초 주기로 3회 성공/실패 체크
    timeout = 3
    healthy_threshold = 2
    unhealthy_threshold = 2
  }
  #오토 스케일은 동적으로 target이 변경되서 정적target 등록을 하지않고,
  # 오토 스케일쪽에 타겟그룹지정.
}