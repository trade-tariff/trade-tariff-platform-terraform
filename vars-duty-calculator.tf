locals {
  duty_calculator_vars = [
    {
      name  = "/${local.environment}/duty_calculator/DUTY_CALCULATOR_EXCISE_STEP_ENABLED"
      value = "true"
    },
    {
      name  = "/${local.environment}/duty_calculator/NEW_RELIC_APP_NAME"
      value = "tariff-duty-calculator-${local.environment}"
    },
    {
      name  = "/${local.environment}/duty_calculator/NEW_RELIC_CAPTURE_PARAMS"
      value = "true"
    },
    {
      name  = "/${local.environment}/duty_calculator/TRADE_TARIFF_FRONTEND_URL"
      value = "https://${local.environment-key}.${local.base_url}"
      # TODO: scope this due to www
    },
    {
      name  = "/${local.environment}/duty_calculator/SECRET_KEY_BASE"
      value = var.tariff_duty_calculator_secret_key_base
    },
    {
      name  = "/${local.environment}/duty_calculator/SENTRY_DSN"
      value = var.tariff_duty_calculator_sentry_dsn
    },
    {
      name  = "/${local.environment}/duty_calculator/SENTRY_PROJECT"
      value = "tariff-duty-calculator"
    },
    {
      name  = "/${local.environment}/duty_calculator/UPDATED_NAVIGATION"
      value = "true"
    }
  ]
}

variable "tariff_duty_calculator_secret_key_base" {
  description = "Duty calculator secret key base."
  type        = string
  sensitive   = true
}

variable "tariff_duty_calculator_sentry_dsn" {
  description = "Duty calculator Sentry DSN."
  type        = string
  sensitive   = true
}
