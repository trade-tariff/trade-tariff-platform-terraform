locals {
  signon_vars = [
    {
      name  = "/${local.environment}/signon/ACTIVE_RECORD_ENCRYPTION_KEY_DERIVATION_SALT"
      value = ""
    },
    {
      name  = "/${local.environment}/signon/ACTIVE_RECORD_ENCRYPTION_PRIMARY_KEY"
      value = ""
    },
    {
      name  = "/${local.environment}/signon/DEVISE_PEPPER"
      value = ""
    },
    {
      name  = "/${local.environment}/signon/DEVISE_SECRET_KEY"
      value = ""
    },
    {
      name  = "/${local.environment}/signon/EMAIL_APP_NAME"
      value = "Trade Tariff Signon"
    },
    {
      name  = "/${local.environment}/signon/EMAIL_FROM_ADDRESS"
      value = local.no_reply
    },
    {
      name  = "/${local.environment}/signon/GOVUK_APP_DOMAIN"
      value = "tariff-signon-${environment_key}.${local.paas_url}"
    },
    {
      name  = "/${local.environment}/signon/GOVUK_APP_NAME"
      value = "tariff-signon-${environment_key}"
    },
    {
      name  = "/${local.environment}/signon/GOVUK_WEBSITE_ROOT"
      value = "https://tariff-signon-${environment_key}.${local.paas_url}"
    },
    {
      name  = "/${local.environment}/signon/REDIS_URL"
      value = ""
    },
    {
      name  = "/${local.environment}/signon/SECRET_KEY_BASE"
      value = ""
    },
    {
      name  = "/${local.environment}/signon/WEB_CONCURRENCY"
      value = "2"
    }
  ]
}
