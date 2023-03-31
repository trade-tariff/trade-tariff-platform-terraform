locals {
  search_query_parser_vars = [
    {
      name  = "${local.var_path}/SENTRY_DSN"
      value = var.tariff_search_query_parser_sentry_dsn
    },
    {
      name  = "${local.var_path}/EXPAND_EQUIVALENT_SYNONYMS"
      value = "false"
    },
    {
      name  = "${local.var_path}/EXPAND_EXPLICIT_SYNONYMS"
      value = "true"
    },
    {
      name  = "${local.var_path}/PACKAGE_BUCKET_NAME"
      value = aws_s3_bucket.this["opensearch_packages"].id
    },
    {
      name  = "${local.var_path}/SPELLING_CORRECTOR_BUCKET_NAME"
      value = aws_s3_bucket.this["search_configuration"].id
    },
    {
      name  = "${local.var_path}/SYNONYM_PACKAGE_BUCKET_NAME"
      value = aws_s3_bucket.this["opensearch_packages"].id
    }
  ]
}

variable "tariff_search_query_parser_sentry_dsn" {
  description = "Search query parser Sentry DSN."
  type        = string
  sensitive   = true
}
