resource "aws_cloudfront_origin_access_identity" "this" {
  comment = "API Docs S3"
}

module "api_docs_cloudfront" {
  source = "git@github.com:trade-tariff/trade-tariff-platform-terraform-modules.git//aws/cloudfront?ref=aws/cloudfront-v1.0.1"

  aliases         = [local.api_alias]
  route53_zone_id = data.aws_route53_zone.selected.id
  comment         = "API Docs ${title(var.environment)} CDN"

  default_root_object = "index.html"
  enabled             = true
  is_ipv6_enabled     = true
  price_class         = "PriceClass_100"

  web_acl_id = module.waf.web_acl_id

  logging_config = {
    bucket = "trade-tariff-logs.s3.amazonaws.com"
    prefix = "cloudfront/api-docs/${local.environment_key}"
  }

  origin = {
    "api-docs-${var.environment}" = {
      domain_name = aws_s3_bucket.this["api_docs"].bucket_regional_domain_name
      origin_id   = aws_cloudfront_origin_access_identity.this.cloudfront_access_identity_path
    }
  }

  cache_behavior = {
    default = {
      allowed_methods        = ["GET", "HEAD", "OPTIONS"]
      cached_methods         = ["GET", "HEAD"]
      target_origin_id       = aws_cloudfront_origin_access_identity.this.cloudfront_access_identity_path
      viewer_protocol_policy = "redirect-to-https"

      cache_policy_id          = data.aws_cloudfront_cache_policy.caching_disabled.id
      origin_request_policy_id = aws_cloudfront_origin_request_policy.forward_all_qsa.id
    }
  }

  viewer_certificate = {
    ssl_support_method  = "sni-only"
    acm_certificate_arn = module.acm.aws_acm_certificate_arn
    depends_on = [
      module.acm.aws_acm_certificate_arn
    ]
  }
}
