locals {
  search_query_parser_vars = [
    {
      name  = "/${var.environment}/search_query_parser/SENTRY_DSN"
      value = var.tariff_search_query_parser_sentry_dsn
    },
    {
      name  = "/${var.environment}/search_query_parser/EXPAND_EQUIVALENT_SYNONYMS"
      value = "false"
    },
    {
      name  = "/${var.environment}/search_query_parser/EXPAND_EXPLICIT_SYNONYMS"
      value = "true"
    },
    {
      name  = "/${var.environment}/search_query_parser/PACKAGE_BUCKET_NAME"
      value = aws_s3_bucket.this["opensearch_packages"].id
    },
    {
      name  = "/${var.environment}/search_query_parser/SPELLING_CORRECTOR_BUCKET_NAME"
      value = aws_s3_bucket.this["search_configuration"].id
    },
    {
      name  = "/${var.environment}/search_query_parser/SYNONYM_PACKAGE_BUCKET_NAME"
      value = aws_s3_bucket.this["opensearch_packages"].id
    }
  ]
}

variable "tariff_search_query_parser_sentry_dsn" {
  description = "Search query parser Sentry DSN."
  type        = string
  sensitive   = true
}
