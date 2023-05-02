resource "aws_cloudfront_origin_access_identity" "this" {
  comment = "API Docs S3"
}

locals {
  s3_origin_id = "API Docs S3"
}

resource "aws_cloudfront_distribution" "this" {
  origin {
    domain_name = aws_s3_bucket.this["api_docs"].bucket_regional_domain_name
    origin_id   = local.s3_origin_id

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.this.cloudfront_access_identity_path
    }
  }

  aliases             = var.environment == "production" ? [] : [local.api_alias]
  comment             = "API Docs ${title(var.environment)} CDN"
  default_root_object = "index.html"
  enabled             = true
  is_ipv6_enabled     = true
  price_class         = "PriceClass_100"
  web_acl_id          = module.waf.web_acl_id

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD"]
    cached_methods   = ["GET", "HEAD"]
    compress         = true
    target_origin_id = local.s3_origin_id

    forwarded_values {
      query_string = true
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  custom_error_response {
    error_caching_min_ttl = 3600
    error_code            = 403
    response_code         = 404
    response_page_path    = "/404.html"
  }

  viewer_certificate {
    acm_certificate_arn      = module.api_certificate.aws_acm_certificate_arn
    minimum_protocol_version = "TLSv1.2_2021"
    ssl_support_method       = "sni-only"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  lifecycle {
    ignore_changes = [origin]
  }

  depends_on = [
    module.api_certificate.aws_acm_certificate_arn
  ]
}

resource "aws_route53_record" "cloudfront_record" {
  name    = local.api_alias
  type    = "CNAME"
  ttl     = 60
  records = [aws_cloudfront_distribution.this.domain_name]
  zone_id = data.aws_route53_zone.selected.id
}
