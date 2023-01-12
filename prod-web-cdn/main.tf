##################################################################
# cloudfront작업 홀딩...
# 증명관리자는 정상 동작
##################################################################
// prod - cdn
provider "aws" {
  #   region                  = "ap-northeast-2"
  region                  = "us-east-1"
  profile                 = "22shop"
  shared_credentials_file = "C:/Users/aa/.aws/credentials"
  #4.x버전의 AWS공급자 허용
  version = "~> 4.0"
}
// GET 계정정보
data "aws_caller_identity" "this" {}
// 테라폼클라우드
data "terraform_remote_state" "hq_vpc_id" {
  backend = "remote"

  config = {
    organization = "22shop"

    workspaces = {
      name = "web-network-sdjo"
    }
  }
}

data "aws_route53_zone" "ddochi" {
  name         = "ddochi.me"
  private_zone = false
}

locals {
  domain_name = "ddochi.me"
  common_tags = {
    project = "22shop"
  }
  s3_origin_id = "myS3Origin"
}
# module "acm-certificate" {
#   source            = "../modules/acm-certificate"
#   domain_name       = "*.${local.domain_name}"
#   tag_name          = local.common_tags.project
#   validation_method = "DNS"
# }
resource "aws_acm_certificate" "example" {
  domain_name       = "*.${local.domain_name}"
  validation_method = "DNS"
}
resource "aws_route53_record" "example" {
  for_each = {
    for dvo in aws_acm_certificate.example.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.ddochi.zone_id
}

resource "aws_acm_certificate_validation" "example" {
  certificate_arn         = aws_acm_certificate.example.arn
  validation_record_fqdns = [for record in aws_route53_record.example : record.fqdn]
}


////////////////////////////////////////////////////////////
# resource "aws_cloudfront_distribution" "s3_distribution" {
#   origin {
#     domain_name = data.aws_route53_zone.ddochi.name
#     origin_id                = local.s3_origin_id
#   }

#   enabled             = true
#   is_ipv6_enabled     = true
#   comment             = "Some comment"
#   default_root_object = "index.html"


#   aliases = ["cdn.example.com"]

#   //기본캐시동작
#   default_cache_behavior {
#     allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
#     cached_methods   = ["GET", "HEAD"]
#     target_origin_id = local.s3_origin_id

#     forwarded_values {
#       query_string = false

#       cookies {
#         forward = "none"
#       }
#     }

#     viewer_protocol_policy = "allow-all"
#     min_ttl                = 0
#     default_ttl            = 3600
#     max_ttl                = 86400
#   }



#   price_class = "PriceClass_100"

#   restrictions {
#     geo_restriction {
#       restriction_type = "whitelist"
#       locations        = ["US", "CA", "GB", "DE"]
#     }
#   }

#   tags = {
#     Environment = "production"
#   }

#   viewer_certificate {
#     cloudfront_default_certificate = true
#     acm_certificate_arn            = aws_acm_certificate.example.arn
#     minimum_protocol_version = "TLSv1.2_2021"
#   }
# }
