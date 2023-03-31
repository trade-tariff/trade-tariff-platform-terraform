locals {
  backend_common_vars = [
    {
      name  = "/${local.environment}/backend/common/ALLOW_MISSING_MIGRATION_FILES"
      value = "true"
    },
    {
      name  = "/${local.environment}/backend/common/AWS_BUCKET_NAME"
      value = "trade-tariff-persistence-${local.environment}"
    },
    {
      name  = "/${local.environment}/backend/common/BETA_SEARCH_MAX_HITS"
      value = "1000"
    },
    {
      name  = "/${local.environment}/backend/common/DB_POOL"
      value = "20"
    },
    {
      name  = "/${local.environment}/backend/common/FRONTEND_HOST"
      value = "https://dev.${local.base_url}/"
    },
    {
      name  = "/${local.environment}/backend/common/MALLOC_ARENA_MAX"
      value = "2"
    },
    {
      name  = "/${local.environment}/backend/common/MAX_THREADS"
      value = "6"
    },
    {
      name  = "/${local.environment}/backend/common/NEW_RELIC_AGENT_ENABLED"
      value = "false"
    },
    {
      name  = "/${local.environment}/backend/common/NEW_RELIC_APP_NAME"
      value = "tariff-uk-backend-${local.environment}"
    },
    {
      name  = "/${local.environment}/backend/common/NEW_RELIC_DISTRIBUTED_TRACING"
      value = "true"
    },
    {
      name  = "/${local.environment}/backend/common/PAAS_S3_SERVICE_NAME"
      value = "tariff-pdf-${local.environment-key}"
    },
    {
      name  = "/${local.environment}/backend/common/RACK_TIMEOUT_SERVICE"
      value = "50"
    },
    {
      name  = "/${local.environment}/backend/common/RACK_TIMEOUT_SERVICE_TIMEOUT"
      value = "50"
    },
    {
      name  = "/${local.environment}/backend/common/RACK_TIMEOUT_WAIT_TIMEOUT"
      value = "100"
    },
    {
      name  = "/${local.environment}/backend/common/SECRET_KEY_BASE"
      value = var.tariff_backend_secret_key_base
    },
    {
      name  = "/${local.environment}/backend/common/SENTRY_DSN"
      value = var.tariff_backend_sentry_dsn
    },
    {
      name  = "/${local.environment}/backend/common/SENTRY_PROJECT"
      value = "tariff-backend"
    },
    {
      name  = "/${local.environment}/backend/common/SPELLING_CORRECTOR_BUCKET_NAME"
      value = "trade-tariff-search-configuration-${local.environment}"
    },
    {
      name  = "/${local.environment}/backend/common/STEMMING_EXCLUSION_REFERENCE_ANALYZER"
      value = "analyzers/F102794475"
    },
    {
      name  = "/${local.environment}/backend/common/SYNONYM_REFERENCE_ANALYZER"
      value = "analyzers/F135140295"
    },
    {
      name  = "/${local.environment}/backend/common/TARIFF_IGNORE_PRESENCE_ERRORS"
      value = "1"
    },
    {
      name  = "/${local.environment}/backend/common/TARIFF_MEASURES_LOGGER"
      value = "1"
    },
    {
      name  = "/${local.environment}/backend/common/TARIFF_QUERY_SEARCH_PARSER_URL"
      value = "http://tariff-search-query-parser-${local.environment-key}.apps.internal:8080/api/search/"
    },
    {
      name  = "/${local.environment}/backend/common/TARIFF_SYNC_EMAIL"
      value = ""
    },
    {
      name  = "/${local.environment}/backend/common/TARIFF_SYNC_HOST"
      value = ""
    },
    {
      name  = "/${local.environment}/backend/common/TARIFF_SYNC_PASSWORD"
      value = ""
    },
    {
      name  = "/${local.environment}/backend/common/TARIFF_SYNC_USERNAME"
      value = ""
    },
    {
      name  = "/${local.environment}/backend/common/TRADE_TARIFF_OAUTH_ID"
      value = ""
    },
    {
      name  = "/${local.environment}/backend/common/TRADE_TARIFF_OAUTH_SECRET"
      value = ""
    },
    {
      name  = "/${local.environment}/backend/common/WEB_CONCURRENCY"
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
