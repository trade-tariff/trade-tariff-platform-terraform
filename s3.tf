resource "aws_s3_bucket" "persistence" {
  bucket = "${local.project}-persistence-${var.environment}"
  acl    = "private"
  tags   = local.tags
}

resource "aws_s3_bucket_public_access_block" "persistence" {
  bucket = aws_s3_bucket.persistence.id

  restrict_public_buckets = true
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
}

resource "aws_iam_policy" "persistence" {
  name        = "persistence-read-write-${var.environment}"
  description = "Provides read and write access to persistence bucket, used for storing ETL files."
  policy      = data.aws_iam_policy_document.s3_persistence_policy.json
  tags        = local.tags
}
