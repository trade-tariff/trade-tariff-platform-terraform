locals {
  buckets = {
    persistence          = "${local.project}-persistence-${var.environment}"
    opensearch_packages  = "${local.project}-opensearch-packages-${var.environment}"
    search_configuration = "${local.project}-search-configuration-${var.environment}"
    api_docs             = "${local.project}-api-docs-${var.environment}"
  }
}

resource "aws_s3_bucket" "this" {
  for_each = local.buckets
  bucket   = each.value
  tags     = local.tags
}

resource "aws_s3_bucket_acl" "this" {
  for_each = local.buckets
  bucket   = each.value
  acl      = "private"
}

resource "aws_s3_bucket_public_access_block" "this" {
  for_each = local.buckets
  bucket   = aws_s3_bucket.this[each.key].id

  restrict_public_buckets = true
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
}
