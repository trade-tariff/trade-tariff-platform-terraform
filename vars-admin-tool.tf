locals {
  admin_tool_vars = [
    {
      name  = "/${var.environment}/admin/BEARER_TOKEN"
      value = var.tariff_admin_bearer_token
    },
    {
      name  = "/${var.environment}/admin/GDS_SSO_STRATEGY"
      value = "real"
    },
    {
      name  = "/${var.environment}/admin/GOVUK_APP_DOMAIN"
      value = "tariff-admin-${local.environment_key}.${local.paas_url}"
    },
    {
      name  = "/${var.environment}/admin/MAX_THREADS"
      value = "16"
    },
    {
      name  = "/${var.environment}/admin/PLEK_SERVICE_TARIFF_API_URI"
      value = "http://tariff-uk-backend-${local.environment_key}.apps.internal:8080"
    },
    {
      name  = "/${var.environment}/admin/SECRET_KEY_BASE"
      value = var.tariff_admin_secret_key_base
    },
    {
      name  = "/${var.environment}/admin/SENTRY_DSN"
      value = var.tariff_admin_sentry_dsn
    },
    {
      name  = "/${var.environment}/admin/TARIFF_ADMIN_OAUTH_ID"
      value = var.tariff_admin_oauth_id
    },
    {
      name  = "/${var.environment}/admin/TARIFF_ADMIN_OAUTH_SECRET"
      value = var.tariff_admin_oauth_secret
    },
    {
      name  = "/${var.environment}/admin/WEB_CONCURRENCY"
      value = "1"
    }
  ]
}

variable "tariff_admin_bearer_token" {
  description = "Admin tool bearer token."
  type        = string
  sensitive   = true
}

variable "tariff_admin_oauth_id" {
  description = "Admin tool OAuth ID."
  type        = string
  sensitive   = true
}

variable "tariff_admin_oauth_secret" {
  description = "Admin tool OAuth secret."
  type        = string
  sensitive   = true
}

variable "tariff_admin_secret_key_base" {
  description = "Admin tool secret key base."
  type        = string
  sensitive   = true
}

variable "tariff_admin_sentry_dsn" {
  description = "Admin tool Sentry DSN."
  type        = string
  sensitive   = true
}
