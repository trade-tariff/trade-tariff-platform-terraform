locals {
  backend_uk_vars = [
    {
      name  = "${local.backend.var_path}/CDS"
      value = "true"
    },
    {
      name  = "${local.backend.var_path}/GOVUK_APP_DOMAIN"
      value = "tariff-uk-backend-${local.environment-key}.apps.internal"
    },
    {
      name  = "${local.backend.var_path}/NEW_RELIC_APP_NAME"
      value = "tariff-uk-backend-${local.environment}"
    },
    {
      name  = "${local.backend.var_path}/SERVICE"
      value = "uk"
    },
    {
      name  = "${local.backend.var_path}/TARIFF_FROM_EMAIL"
      value = "Tariff UK [${upper(local.environment)}] <${local.no_reply}>"
    }
  ]

  backend_xi_vars = [
    {
      name  = "/${local.environment}/backend/xi/CDS"
      value = "false"
    },
    {
      name  = "/${local.environment}/backend/xi/GOVUK_APP_DOMAIN"
      value = "tariff-xi-backend-${local.environment-key}.apps.internal"
    },
    {
      name  = "/${local.environment}/backend/xi/NEW_RELIC_APP_NAME"
      value = "tariff-xi-backend-${local.environment}"
    },
    {
      name  = "/${local.environment}/backend/xi/SERVICE"
      value = "xi"
    },
    {
      name  = "/${local.environment}/backend/xi/TARIFF_FROM_EMAIL"
      value = "Tariff XI [${upper(local.environment)}] <${local.no_reply}>"
    }
  ]
}
