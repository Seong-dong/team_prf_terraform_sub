resource "aws_acm_certificate" "cert" {
  domain_name       = var.domain_name
  validation_method = var.validation_method

  tags = {
    Environment = "${var.tag_name}"
  }

  lifecycle {
    create_before_destroy = true
  }
}