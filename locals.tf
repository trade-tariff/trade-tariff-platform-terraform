locals {
  project  = "trade-tariff"
  base_url = "${local.project}.service.gov.uk"
  paas_url = "london.cloudapps.digital"
  no_reply = "no-reply@${local.base_url}"

  environment_key = var.environment == "development" ? "dev" : var.environment
  cdn_alias       = var.environment == "production" ? "www.${local.base_url}" : "${local.environment_key}.${local.base_url}"
  api_alias       = var.environment == "production" ? "api.${local.base_url}" : "api.${local.environment_key}.${local.base_url}"

  tags = {
    Project     = local.project
    Environment = var.environment
  }
}

data "aws_route53_zone" "selected" {
  name         = local.base_url
  private_zone = false
}
