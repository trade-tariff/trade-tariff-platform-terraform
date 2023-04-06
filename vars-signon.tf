locals {
  signon_vars = [
    {
      name  = "/${var.environment}/signon/ACTIVE_RECORD_ENCRYPTION_KEY_DERIVATION_SALT"
      value = ""
    },
    {
      name  = "/${var.environment}/signon/ACTIVE_RECORD_ENCRYPTION_PRIMARY_KEY"
      value = ""
    },
    {
      name  = "/${var.environment}/signon/DEVISE_PEPPER"
      value = ""
    },
    {
      name  = "/${var.environment}/signon/DEVISE_SECRET_KEY"
      value = ""
    },
    {
      name  = "/${var.environment}/signon/EMAIL_APP_NAME"
      value = "Trade Tariff Signon"
    },
    {
      name  = "/${var.environment}/signon/EMAIL_FROM_ADDRESS"
      value = local.no_reply
    },
    {
      name  = "/${var.environment}/signon/GOVUK_APP_DOMAIN"
      value = "tariff-signon-${local.environment_key}.${local.paas_url}"
    },
    {
      name  = "/${var.environment}/signon/GOVUK_APP_NAME"
      value = "tariff-signon-${local.environment_key}"
    },
    {
      name  = "/${var.environment}/signon/GOVUK_WEBSITE_ROOT"
      value = "https://tariff-signon-${local.environment_key}.${local.paas_url}"
    },
    {
      name  = "/${var.environment}/signon/REDIS_URL"
      value = ""
    },
    {
      name  = "/${var.environment}/signon/SECRET_KEY_BASE"
      value = ""
    },
    {
      name  = "/${var.environment}/signon/WEB_CONCURRENCY"
      value = "2"
    }
  ]
}
