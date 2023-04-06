locals {
  duty_calculator_vars = [
    {
      name  = "/${var.environment}/duty_calculator/DUTY_CALCULATOR_EXCISE_STEP_ENABLED"
      value = "true"
    },
    {
      name  = "/${var.environment}/duty_calculator/NEW_RELIC_APP_NAME"
      value = "tariff-duty-calculator-${var.environment}"
    },
    {
      name  = "/${var.environment}/duty_calculator/NEW_RELIC_CAPTURE_PARAMS"
      value = "true"
    },
    {
      name  = "/${var.environment}/duty_calculator/TRADE_TARIFF_FRONTEND_URL"
      value = "https://${local.environment_key}.${local.base_url}"
      # TODO: scope this due to www
    },
    {
      name  = "/${var.environment}/duty_calculator/SECRET_KEY_BASE"
      value = var.tariff_duty_calculator_secret_key_base
    },
    {
      name  = "/${var.environment}/duty_calculator/SENTRY_DSN"
      value = var.tariff_duty_calculator_sentry_dsn
    },
    {
      name  = "/${var.environment}/duty_calculator/SENTRY_PROJECT"
      value = "tariff-duty-calculator"
    },
    {
      name  = "/${var.environment}/duty_calculator/UPDATED_NAVIGATION"
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
