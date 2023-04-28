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

resource "aws_s3_bucket_public_access_block" "this" {
  for_each = local.buckets
  bucket   = aws_s3_bucket.this[each.key].id

  restrict_public_buckets = true
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
}

data "aws_iam_policy_document" "api_docs_s3_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.this["api_docs"].arn}/*"]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.this.iam_arn]
    }
  }
}

resource "aws_s3_bucket_policy" "api_docs" {
  bucket = aws_s3_bucket.this["api_docs"].id
  policy = data.aws_iam_policy_document.api_docs_s3_policy.json
}
