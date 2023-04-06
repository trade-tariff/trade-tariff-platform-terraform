locals {
  frontend_vars = [
    {
      name  = "/${var.environment}/frontend/BETA_SEARCH"
      value = "true"
    },
    {
      name  = "/${var.environment}/frontend/BETA_SEARCH_HEADING_STATISTICS_THRESHOLD"
      value = "3"
    },
    {
      name  = "/${var.environment}/frontend/BETA_SEARCH_SWITCHING_ENABLED"
      value = "true"
    },
    {
      name  = "/${var.environment}/frontend/CORS_HOST"
      value = "${local.environment_key}.${local.base_url}"
    },
    {
      name  = "/${var.environment}/frontend/DUTY_CALCULATOR_BASE_URL"
      value = "https://${local.environment_key}.${local.base_url}/duty-calculator"
    },
    {
      name  = "/${var.environment}/frontend/GOVUK_APP_DOMAIN"
      value = "tariff-frontend-${local.environment_key}.${local.paas_url}"
    },
    {
      name  = "/${var.environment}/frontend/GOVUK_ASSET_ROOT"
      value = "assets-${local.environment_key}.${local.base_url}"
    },
    {
      name  = "/${var.environment}/frontend/HOST"
      value = "${local.environment_key}.${local.base_url}"
    },
    {
      name  = "/${var.environment}/frontend/MALLOC_ARENA_MAX"
      value = "2"
    },
    {
      name  = "/${var.environment}/frontend/MAX_THREADS"
      value = "6"
    },
    {
      name  = "/${var.environment}/frontend/NEW_RELIC_APP_NAME"
      value = "tariff-frontend-${var.environment}"
    },
    {
      name  = "/${var.environment}/frontend/ROO_WIZARD"
      value = "true"
    },
    {
      name  = "/${var.environment}/frontend/SEARCH_BANNER"
      value = "false"
    },
    {
      name  = "/${var.environment}/frontend/SECRET_KEY_BASE"
      value = var.tariff_frontend_secret_key_base
    },
    {
      name  = "/${var.environment}/frontend/SENTRY_DSN"
      value = var.tariff_frontend_sentry_dsn
    },
    {
      name  = "/${var.environment}/frontend/SERVICE_DEFAULT"
      value = "uk"
    },
    {
      name  = "/${var.environment}/frontend/STW_URI"
      value = "https://check-how-to-import-export-goods.service.gov.uk/import/check-licences-certificates-and-other-restrictions"
    },
    {
      name  = "/${var.environment}/frontend/TARIFF_API_VERSION"
      value = "2"
    },
    {
      name  = "/${var.environment}/frontend/TARIFF_FROM_EMAIL"
      value = "Tariff Frontend [${title(var.environment)}] <${local.no_reply}>"
    },
    {
      name  = "/${var.environment}/frontend/TARIFF_TO_EMAIL"
      value = "trade-tariff-support@enginegroup.com"
    },
    {
      name  = "/${var.environment}/frontend/WEB_CONCURRENCY"
      value = "6"
    },
    {
      name  = "/${var.environment}/frontend/WEBCHAT_URL"
      value = "https://www.tax.service.gov.uk/ask-hmrc/chat/trade-tariff"
    },
    {
      name  = "/${var.environment}/frontend/WELSH"
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
