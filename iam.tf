locals {
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

resource "aws_iam_access_key" "service_account" {
  user = aws_iam_user.service_account.name
}

resource "aws_iam_user" "service_account" {
  name = "${local.project}-service-${var.environment}"
  path = "/system/"
}

resource "aws_iam_policy" "this" {
  for_each    = local.buckets
  name        = "${replace(each.key, "_", "-")}-bucket-policy-${var.environment}"
  description = "Provides read and write access to the ${replace(each.key, "_", " ")} bucket."
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

resource "aws_iam_user_policy_attachment" "this" {
  for_each   = local.buckets
  user       = aws_iam_user.service_account.name
  policy_arn = aws_iam_policy.this[each.key].arn
}
