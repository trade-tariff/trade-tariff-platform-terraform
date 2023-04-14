# TODO: don't do this once we've migrated off Gov PaaS
output "service_account_secret_key" {
  value     = aws_iam_access_key.service_account.secret
  sensitive = true
}
