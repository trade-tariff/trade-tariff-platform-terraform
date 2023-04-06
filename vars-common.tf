locals {
  common_vars = [
    {
      name  = "/${var.environment}/common/API_SERVICE_BACKEND_URL_OPTIONS"
      value = "{\"uk\":\"http://tariff-uk-backend-${local.environment_key}.apps.internal:8080\",\"xi\":\"http://tariff-xi-backend-${local.environment_key}.apps.internal:8080\"}"
    },
    {
      name  = "/${var.environment}/common/GOVUK_WEBSITE_ROOT"
      value = "https://www.gov.uk"
    },
    {
      name  = "/${var.environment}/common/NEW_RELIC_LICENSE_KEY"
      value = var.new_relic_licence_key
    },
    {
      name  = "/${var.environment}/common/NEW_RELIC_DISTRIBUTED_TRACING"
      value = "true"
    },
    {
      name  = "/${var.environment}/common/NEW_RELIC_ENV"
      value = var.environment
    },
    {
      name  = "/${var.environment}/common/NEW_RELIC_LOG"
      value = "stdout"
    },
    {
      name  = "/${var.environment}/common/PLEK_SERVICE_SIGNON_URI"
      value = "https://signon-${local.environment_key}.${local.paas_url}"
    },
    {
      name  = "/${var.environment}/common/RUBYOPT"
      value = "--enable-yjit"
    },
    {
      name  = "/${var.environment}/common/SENTRY_ENVIRONMENT"
      value = var.environment
    }
  ]
}
