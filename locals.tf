locals {
  base_url        = "trade-tariff.service.gov.uk"
  paas_url        = "london.cloudapps.digital"
  environment_key = var.environment == "development" ? "dev" : var.environment
  cdn_aliases     = var.environment == "production" ? ["www.${local.base_url}"] : ["${local.environment_key}.${local.base_url}"]
}
