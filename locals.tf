locals {
  project  = "trade-tariff"
  base_url = "${local.project}.service.gov.uk"
  paas_url = "london.cloudapps.digital"
  no_reply = "no-reply@${local.base_url}"

  environment_key = var.environment == "development" ? "dev" : var.environment
  cdn_aliases     = var.environment == "production" ? ["www.${local.base_url}"] : ["${local.environment_key}.${local.base_url}"]

  tags = {
    Project     = local.project
    Environment = var.environment
  }
}
