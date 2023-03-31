data "aws_iam_policy_document" "s3_persistence_policy" {
  statement {
    effect = "Allow"
    actions = [
      "s3:GetBucketLocation",
      "s3:ListBucket",
      "s3:ListBucketMultipartUploads",
      "s3:ListBucketVersions",
      "s3:AbortMultipartUpload",
      "s3:DeleteObject*",
      "s3:GetObject*",
      "s3:ListMultipartUploadParts",
      "s3:PutObject*",
      "s3:RestoreObject",
    ]
    resources = [
      aws_s3_bucket.persistence.arn,
      "${aws_s3_bucket.persistence.arn}/*"
    ]
  }
}
