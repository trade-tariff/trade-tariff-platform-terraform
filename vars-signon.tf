locals {
  signon_vars = [
    {
      name  = "/${var.environment}/signon/ACTIVE_RECORD_ENCRYPTION_KEY_DERIVATION_SALT"
      value = var.tariff_signon_active_record_derivation_salt
    },
    {
      name  = "/${var.environment}/signon/ACTIVE_RECORD_ENCRYPTION_PRIMARY_KEY"
      value = var.tariff_signon_active_record_primary_key
    },
    {
      name  = "/${var.environment}/signon/DEVISE_PEPPER"
      value = var.tariff_signon_devise_pepper
    },
    {
      name  = "/${var.environment}/signon/DEVISE_SECRET_KEY"
      value = var.tariff_signon_devise_secret_key
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
      value = var.tariff_signon_redis_url
    },
    {
      name  = "/${var.environment}/signon/SECRET_KEY_BASE"
      value = var.tariff_signon_secret_key_base
    },
    {
      name  = "/${var.environment}/signon/WEB_CONCURRENCY"
      value = "2"
    }
  ]
}

variable "tariff_signon_devise_pepper" {
  description = "Tariff Signon Devise Pepper."
  type        = string
  sensitive   = true
  default     = "" # signon only runs on dev
}

variable "tariff_signon_devise_secret_key" {
  description = "Tariff Signon Devise Secret Key."
  type        = string
  sensitive   = true
  default     = "" # signon only runs on dev
}

variable "tariff_signon_active_record_derivation_salt" {
  description = "Tariff Signon Active Record Encryption Key Derivation Salt."
  type        = string
  sensitive   = true
  default     = "" # signon only runs on dev
}

variable "tariff_signon_active_record_primary_key" {
  description = "Tariff Signon Active Record Encryption Primary Key."
  type        = string
  sensitive   = true
  default     = "" # signon only runs on dev
}

variable "tariff_signon_secret_key_base" {
  description = "Tariff Signon Secret Key Base."
  type        = string
  sensitive   = true
  default     = "" # signon only runs on dev
}

variable "tariff_signon_redis_url" {
  description = "Tariff Signon Redis URL."
  type        = string
  sensitive   = true
  default     = "" # signon only runs on dev
}
