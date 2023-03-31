module "cloudfront" {
  source = "git@github.com:trade-tariff/trade-tariff-platform-terraform-modules.git//trade-tariff/cdn?ref=trade-tariff/cdn-v1.0.0"

  environment_name = var.environment
  environment_key  = local.environment_key

  # TODO: resolve when www is fixed
  cdn_aliases     = var.environment == "production" ? ["www.${local.base_url}"] : ["${local.environment_key}.${local.base_url}"]
  origin_endpoint = "tariff-frontend-${local.environment_key}.${local.paas_url}"
  web_acl_id      = module.waf.web_acl_id
}

module "waf" {
  source = "git@github.com:trade-tariff/trade-tariff-platform-terraform-modules.git//aws/waf?ref=aws/waf-v1.1.3"

  name  = "tariff-waf-${var.environment}"
  scope = "CLOUDFRONT"
  ip_rate_based_rule = {
    name      = "ratelimiting"
    priority  = 1
    rpm_limit = var.waf_rpm_limit
    action    = "block"
    custom_response = {
      response_code = 429
      body_key      = "rate-limit-exceeded"
      response_header = {
        name  = "X-Rate-Limit"
        value = "1"
      }
    }
  }
}
