locals {
  buckets = {
    persistence          = "${local.project}-persistence-${var.environment}"
    opensearch_packages  = "${local.project}-opensearch-packages-${var.environment}"
    search_configuration = "${local.project}-search-configuration-${var.environment}"
  }

  bucket_permissions = {
    limited = [
      "s3:GetBucketLocation",
      "s3:ListBucket",
      "s3:ListBucketMultipartUploads",
      "s3:ListBucketVersions",
    ]
    permissive = [
      "s3:AbortMultipartUpload",
      "s3:AbortUpload",
      "s3:DeleteObject",
      "s3:DeleteObjectTagging",
      "s3:DeleteObjectVersion",
      "s3:DeleteObjectVersionTagging",
      "s3:GetObject",
      "s3:GetObjectAcl",
      "s3:GetObjectTagging",
      "s3:GetObjectTorrent",
      "s3:GetObjectVersion",
      "s3:GetObjectVersionAcl",
      "s3:GetObjectVersionTagging",
      "s3:GetObjectVersionTorrent",
      "s3:ListMultipartUploadParts",
      "s3:ListObjectsV2",
      "s3:ListUploadParts",
      "s3:PutObject",
      "s3:PutObjectAcl",
      "s3:PutObjectTagging",
      "s3:PutObjectVersionAcl",
      "s3:PutObjectVersionTagging",
      "s3:RestoreObject"
    ]
  }

}

resource "aws_s3_bucket" "this" {
  for_each = local.buckets
  bucket   = each.value.name
  acl      = "private"
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

resource "aws_iam_policy" "this" {
  for_each    = local.buckets
  name        = "${each.key}-bucket-policy-${var.environment}"
  description = "Provides read and write access to ${replace(each.key, "-", " ")} bucket."
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = flatten([
          local.bucket_permissions.limited,
          local.bucket_permissions.permissive
        ])
        Effect = "Allow"
        Resources = [
          aws_s3_bucket.this[each.key].arn,
          "${aws_s3_bucket.this[each.key].arn}/*"
        ]
      }
    ]
  })
  tags = local.tags
}
