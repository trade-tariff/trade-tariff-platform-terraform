locals {
  frontend_vars = [
    {
      name  = "/${local.environment}/frontend/BETA_SEARCH"
      value = "true"
    },
    {
      name  = "/${local.environment}/frontend/BETA_SEARCH_HEADING_STATISTICS_THRESHOLD"
      value = "3"
    },
    {
      name  = "/${local.environment}/frontend/BETA_SEARCH_SWITCHING_ENABLED"
      value = "true"
    },
    {
      name  = "/${local.environment}/frontend/CORS_HOST"
      value = "${local.environment_key}.${local.base_url}"
    },
    {
      name  = "/${local.environment}/frontend/DUTY_CALCULATOR_BASE_URL"
      value = "https://${local.environment_key}.${local.base_url}/duty-calculator"
    },
    {
      name  = "/${local.environment}/frontend/GOVUK_APP_DOMAIN"
      value = "tariff-frontend-${local.environment_key}.${local.paas_url}"
    },
    {
      name  = "/${local.environment}/frontend/GOVUK_ASSET_ROOT"
      value = "assets-${local.environment_key}.${local.base_url}"
    },
    {
      name  = "/${local.environment}/frontend/HOST"
      value = "${local.environment_key}.${local.base_url}"
    },
    {
      name  = "/${local.environment}/frontend/MALLOC_ARENA_MAX"
      value = "2"
    },
    {
      name  = "/${local.environment}/frontend/MALLOC_ARENA_MAX"
      value = "2"
    },
    {
      name  = "/${local.environment}/frontend/MAX_THREADS"
      value = "6"
    },
    {
      name  = "/${local.environment}/frontend/NEW_RELIC_APP_NAME"
      value = "tariff-frontend-${local.environment}"
    },
    {
      name  = "/${local.environment}/frontend/ROO_WIZARD"
      value = "true"
    },
    {
      name  = "/${local.environment}/frontend/SEARCH_BANNER"
      value = "false"
    },
    {
      name  = "/${local.environment}/frontend/SECRET_KEY_BASE"
      value = var.tariff_frontend_secret_key_base
    },
    {
      name  = "/${local.environment}/frontend/SENTRY_DSN"
      value = var.tariff_frontend_sentry_dsn
    },
    {
      name  = "/${local.environment}/frontend/SERVICE_DEFAULT"
      value = "uk"
    },
    {
      name  = "/${local.environment}/frontend/STW_URI"
      value = "https://check-how-to-import-export-goods.service.gov.uk/import/check-licences-certificates-and-other-restrictions"
    },
    {
      name  = "/${local.environment}/frontend/TARIFF_API_VERSION"
      value = "2"
    },
    {
      name  = "/${local.environment}/frontend/TARIFF_FROM_EMAIL"
      value = "Tariff Frontend [${title(local.environment)}] <${local.no_reply}>"
    },
    {
      name  = "/${local.environment}/frontend/TARIFF_TO_EMAIL"
      value = "trade-tariff-support@enginegroup.com"
    },
    {
      name  = "/${local.environment}/frontend/WEB_CONCURRENCY"
      value = "6"
    },
    {
      name  = "/${local.environment}/frontend/WEBCHAT_URL"
      value = "https://www.tax.service.gov.uk/ask-hmrc/chat/trade-tariff"
    },
    {
      name  = "/${local.environment}/frontend/WELSH"
      value = "true"
    }
  ]
}

variable "tariff_frontend_secret_key_base" {
  description = "Frontend secret key base."
  type        = string
  sensitive   = true
}

variable "tariff_frontend_sentry_dsn" {
  description = "Frontend Sentry DSN."
  type        = string
  sensitive   = true
}
