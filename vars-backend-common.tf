locals {
  backend_common_vars = [
    {
      name  = "/${var.environment}/backend/common/ALLOW_MISSING_MIGRATION_FILES"
      value = "true"
    },
    {
      name  = "/${var.environment}/backend/common/AWS_BUCKET_NAME"
      value = "trade-tariff-persistence-${var.environment}"
    },
    {
      name  = "/${var.environment}/backend/common/BETA_SEARCH_MAX_HITS"
      value = "1000"
    },
    {
      name  = "/${var.environment}/backend/common/DB_POOL"
      value = "20"
    },
    {
      name  = "/${var.environment}/backend/common/FRONTEND_HOST"
      value = "https://${local.environment_key}.${local.base_url}/"
      # TODO: scope this due to www
    },
    {
      name  = "/${var.environment}/backend/common/MALLOC_ARENA_MAX"
      value = "2"
    },
    {
      name  = "/${var.environment}/backend/common/MAX_THREADS"
      value = "6"
    },
    {
      name  = "/${var.environment}/backend/common/NEW_RELIC_AGENT_ENABLED"
      value = "false"
    },
    {
      name  = "/${var.environment}/backend/common/NEW_RELIC_APP_NAME"
      value = "tariff-uk-backend-${var.environment}"
    },
    {
      name  = "/${var.environment}/backend/common/NEW_RELIC_DISTRIBUTED_TRACING"
      value = "true"
    },
    {
      name  = "/${var.environment}/backend/common/PAAS_S3_SERVICE_NAME"
      value = "tariff-pdf-${local.environment_key}"
    },
    {
      name  = "/${var.environment}/backend/common/RACK_TIMEOUT_SERVICE"
      value = "50"
    },
    {
      name  = "/${var.environment}/backend/common/RACK_TIMEOUT_SERVICE_TIMEOUT"
      value = "50"
    },
    {
      name  = "/${var.environment}/backend/common/RACK_TIMEOUT_WAIT_TIMEOUT"
      value = "100"
    },
    {
      name  = "/${var.environment}/backend/common/SECRET_KEY_BASE"
      value = var.tariff_backend_secret_key_base
    },
    {
      name  = "/${var.environment}/backend/common/SENTRY_DSN"
      value = var.tariff_backend_sentry_dsn
    },
    {
      name  = "/${var.environment}/backend/common/SENTRY_PROJECT"
      value = "tariff-backend"
    },
    {
      name  = "/${var.environment}/backend/common/SPELLING_CORRECTOR_BUCKET_NAME"
      value = "trade-tariff-search-configuration-${var.environment}"
    },
    {
      name  = "/${var.environment}/backend/common/STEMMING_EXCLUSION_REFERENCE_ANALYZER"
      value = "analyzers/F102794475"
    },
    {
      name  = "/${var.environment}/backend/common/SYNONYM_REFERENCE_ANALYZER"
      value = "analyzers/F135140295"
    },
    {
      name  = "/${var.environment}/backend/common/TARIFF_IGNORE_PRESENCE_ERRORS"
      value = "1"
    },
    {
      name  = "/${var.environment}/backend/common/TARIFF_MEASURES_LOGGER"
      value = "1"
    },
    {
      name  = "/${var.environment}/backend/common/TARIFF_QUERY_SEARCH_PARSER_URL"
      value = "http://tariff-search-query-parser-${local.environment_key}.apps.internal:8080/api/search/"
    },
    {
      name  = "/${var.environment}/backend/common/TARIFF_SYNC_EMAIL"
      value = ""
    },
    {
      name  = "/${var.environment}/backend/common/TARIFF_SYNC_HOST"
      value = ""
    },
    {
      name  = "/${var.environment}/backend/common/TARIFF_SYNC_PASSWORD"
      value = ""
    },
    {
      name  = "/${var.environment}/backend/common/TARIFF_SYNC_USERNAME"
      value = ""
    },
    {
      name  = "/${var.environment}/backend/common/TRADE_TARIFF_OAUTH_ID"
      value = ""
    },
    {
      name  = "/${var.environment}/backend/common/TRADE_TARIFF_OAUTH_SECRET"
      value = ""
    },
    {
      name  = "/${var.environment}/backend/common/WEB_CONCURRENCY"
      value = "4"
    }
  ]
}

variable "tariff_backend_secret_key_base" {
  description = "Backend secret key base."
  type        = string
  sensitive   = true
}

variable "tariff_backend_sentry_dsn" {
  description = "Backend Sentry DSN."
  type        = string
  sensitive   = true
}
