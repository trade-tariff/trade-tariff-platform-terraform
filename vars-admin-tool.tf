locals {
  admin_tool_vars = [
    {
      name  = "/${local.environment}/admin/BEARER_TOKEN"
      value = var.tariff_admin_bearer_token
    },
    {
      name  = "/${local.environment}/admin/GDS_SSO_STRATEGY"
      value = "real"
    },
    {
      name  = "/${local.environment}/admin/GOVUK_APP_DOMAIN"
      value = "tariff-admin-dev.${local.paas_url}"
    },
    {
      name  = "/${local.environment}/admin/MAX_THREADS"
      value = "16"
    },
    {
      name  = "/${local.environment}/admin/PLEK_SERVICE_TARIFF_API_URI"
      value = "http://tariff-uk-backend-dev.apps.internal:8080"
    },
    {
      name  = "/${local.environment}/admin/SECRET_KEY_BASE"
      value = var.tariff_admin_secret_key_base
    },
    {
      name  = "/${local.environment}/admin/SENTRY_DSN"
      value = var.tariff_admin_sentry_dsn
    },
    {
      name  = "/${local.environment}/admin/TARIFF_ADMIN_OAUTH_ID"
      value = var.tariff_admin_oauth_id
    },
    {
      name  = "/${local.environment}/admin/TARIFF_ADMIN_OAUTH_SECRET"
      value = var.tariff_admin_oauth_secret
    },
    {
      name  = "/${local.environment}/admin/WEB_CONCURRENCY"
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
