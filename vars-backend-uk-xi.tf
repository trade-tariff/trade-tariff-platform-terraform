locals {
  backend_uk_vars = [
    {
      name  = "/${var.environment}/backend/uk/CDS"
      value = "true"
    },
    {
      name  = "/${var.environment}/backend/uk/GOVUK_APP_DOMAIN"
      value = "tariff-uk-backend-${local.environment_key}.apps.internal"
    },
    {
      name  = "/${var.environment}/backend/uk/NEW_RELIC_APP_NAME"
      value = "tariff-uk-backend-${var.environment}"
    },
    {
      name  = "/${var.environment}/backend/uk/SERVICE"
      value = "uk"
    },
    {
      name  = "/${var.environment}/backend/uk/TARIFF_FROM_EMAIL"
      value = "Tariff UK [${upper(var.environment)}] <${local.no_reply}>"
    }
  ]

  backend_xi_vars = [
    {
      name  = "/${var.environment}/backend/xi/CDS"
      value = "false"
    },
    {
      name  = "/${var.environment}/backend/xi/GOVUK_APP_DOMAIN"
      value = "tariff-xi-backend-${local.environment_key}.apps.internal"
    },
    {
      name  = "/${var.environment}/backend/xi/NEW_RELIC_APP_NAME"
      value = "tariff-xi-backend-${var.environment}"
    },
    {
      name  = "/${var.environment}/backend/xi/SERVICE"
      value = "xi"
    },
    {
      name  = "/${var.environment}/backend/xi/TARIFF_FROM_EMAIL"
      value = "Tariff XI [${upper(var.environment)}] <${local.no_reply}>"
    }
  ]
}
