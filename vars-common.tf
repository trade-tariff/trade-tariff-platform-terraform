locals {
  common_vars = [
    {
      name  = "/${local.environment}/common/API_SERVICE_BACKEND_URL_OPTIONS"
      value = "{\"uk\":\"http://tariff-uk-backend-${local.environment-key}.apps.internal:8080\",\"xi\":\"http://tariff-xi-backend-${local.environment-key}.apps.internal:8080\"}"
    },
    {
      name  = "/${local.environment}/common/GOVUK_WEBSITE_ROOT"
      value = "https://www.gov.uk"
    },
    {
      name  = "/${local.environment}/common/NEW_RELIC_LICENSE_KEY"
      value = var.new_relic_licence_key
    },
    {
      name  = "/${local.environment}/common/NEW_RELIC_DISTRIBUTED_TRACING"
      value = "true"
    },
    {
      name  = "/${local.environment}/common/NEW_RELIC_ENV"
      value = local.environment
    },
    {
      name  = "/${local.environment}/common/NEW_RELIC_LOG"
      value = "stdout"
    },
    {
      name  = "/${local.environment}/common/PLEK_SERVICE_SIGNON_URI"
      value = "https://signon-${local.environment-key}.${local.paas_url}"
    },
    {
      name  = "/${local.environment}/common/RUBYOPT"
      value = "--enable-yjit"
    },
    {
      name  = "/${local.environment}/common/SENTRY_ENVIRONMENT"
      value = local.environment
    }
  ]
}
