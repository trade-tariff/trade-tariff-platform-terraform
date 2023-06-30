data "aws_cloudfront_cache_policy" "caching_disabled" {
  name = "Managed-CachingDisabled"
}

data "aws_cloudfront_cache_policy" "caching_optimized" {
  name = "Managed-CachingOptimized"
}

module "cdn" {
  source = "git@github.com:trade-tariff/trade-tariff-platform-terraform-modules.git//aws/cloudfront?ref=aws/cloudfront-v1.0.1"

  aliases         = [local.cdn_alias]
  route53_zone_id = data.aws_route53_zone.selected.id
  comment         = "${title(var.environment)} CDN"

  enabled         = true
  is_ipv6_enabled = true
  price_class     = "PriceClass_100"

  web_acl_id = module.waf.web_acl_id

  logging_config = {
    bucket = "trade-tariff-logs.s3.amazonaws.com"
    prefix = "cloudfront/${local.environment_key}"
  }

  origin = {
    "frontend-govpaas-${var.environment}" = {
      domain_name = "tariff-frontend-${local.environment_key}.${local.paas_url}"
      custom_origin_config = {
        http_port              = 80
        https_port             = 443
        origin_protocol_policy = "https-only"
        origin_ssl_protocols = [
          "TLSv1.2",
        ]
      }
    }
  }

  cache_behavior = {
    default = {
      target_origin_id       = "frontend-govpaas-${var.environment}"
      viewer_protocol_policy = "redirect-to-https"

      cache_policy_id          = aws_cloudfront_cache_policy.cache_all_qsa.id
      origin_request_policy_id = aws_cloudfront_origin_request_policy.forward_all_qsa.id

      min_ttl     = 0
      default_ttl = 0
      max_ttl     = 0

      compress = false

      allowed_methods = [
        "GET",
        "HEAD",
        "OPTIONS",
        "PUT",
        "POST",
        "PATCH",
        "DELETE"
      ]

      cached_methods = [
        "GET",
        "HEAD"
      ]
    },
  }

  viewer_certificate = {
    ssl_support_method  = "sni-only"
    acm_certificate_arn = module.cdn_certificate.aws_acm_certificate_arn
    depends_on = [
      module.cdn_certificate.aws_acm_certificate_arn
    ]
  }
}

resource "aws_cloudfront_cache_policy" "cache_all_qsa" {
  name        = "Cache-All-QSA-${var.environment}"
  comment     = "Cache all QSA (managed by Terraform)"
  default_ttl = 86400
  max_ttl     = 31536000
  min_ttl     = 1

  parameters_in_cache_key_and_forwarded_to_origin {
    cookies_config {
      cookie_behavior = "none"
    }

    headers_config {
      header_behavior = "none"
    }

    query_strings_config {
      query_string_behavior = "all"
    }
  }
}

resource "aws_cloudfront_origin_request_policy" "forward_all_qsa" {
  name    = "Forward-All-QSA-${var.environment}"
  comment = "Forward all QSA (managed by Terraform)"
  cookies_config {
    cookie_behavior = "all"
  }

  headers_config {
    header_behavior = "allExcept"
    headers {
      items = ["If-None-Match", "If-Modified-Since"]
    }
  }

  query_strings_config {
    query_string_behavior = "all"
  }
}
