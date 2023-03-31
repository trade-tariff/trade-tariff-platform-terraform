# trade-tariff-platform-terraform

Repository to store the Terraform for AWS infrastructure.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 4.61.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.61.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_acm"></a> [acm](#module\_acm) | git@github.com:trade-tariff/trade-tariff-platform-terraform-modules.git//aws/acm | aws/cloudfront-v1.0.1 |
| <a name="module_cdn"></a> [cdn](#module\_cdn) | git@github.com:trade-tariff/trade-tariff-platform-terraform-modules.git//aws/cloudfront | aws/cloudfront-v1.0.1 |
| <a name="module_opensearch"></a> [opensearch](#module\_opensearch) | git@github.com:trade-tariff/trade-tariff-platform-terraform-modules.git//aws/opensearch | aws/opensearch-v1.0.0 |
| <a name="module_ssm"></a> [ssm](#module\_ssm) | git@github.com:trade-tariff/trade-tariff-platform-terraform-modules.git//aws/ssm | aws/ssm-v1.0.0 |
| <a name="module_waf"></a> [waf](#module\_waf) | git@github.com:trade-tariff/trade-tariff-platform-terraform-modules.git//aws/waf | aws/waf-v1.1.3 |

## Resources

| Name | Type |
|------|------|
| [aws_cloudfront_cache_policy.cache_all_qsa](https://registry.terraform.io/providers/hashicorp/aws/4.61.0/docs/resources/cloudfront_cache_policy) | resource |
| [aws_cloudfront_origin_request_policy.forward_all_qsa](https://registry.terraform.io/providers/hashicorp/aws/4.61.0/docs/resources/cloudfront_origin_request_policy) | resource |
| [aws_iam_policy.this](https://registry.terraform.io/providers/hashicorp/aws/4.61.0/docs/resources/iam_policy) | resource |
| [aws_s3_bucket.this](https://registry.terraform.io/providers/hashicorp/aws/4.61.0/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_public_access_block.this](https://registry.terraform.io/providers/hashicorp/aws/4.61.0/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_cloudfront_cache_policy.caching_disabled](https://registry.terraform.io/providers/hashicorp/aws/4.61.0/docs/data-sources/cloudfront_cache_policy) | data source |
| [aws_route53_zone.selected](https://registry.terraform.io/providers/hashicorp/aws/4.61.0/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Deployment environment. | `string` | n/a | yes |
| <a name="input_new_relic_licence_key"></a> [new\_relic\_licence\_key](#input\_new\_relic\_licence\_key) | New Relic API key. | `string` | n/a | yes |
| <a name="input_tariff_admin_bearer_token"></a> [tariff\_admin\_bearer\_token](#input\_tariff\_admin\_bearer\_token) | Admin tool bearer token. | `string` | n/a | yes |
| <a name="input_tariff_admin_oauth_id"></a> [tariff\_admin\_oauth\_id](#input\_tariff\_admin\_oauth\_id) | Admin tool OAuth ID. | `string` | n/a | yes |
| <a name="input_tariff_admin_oauth_secret"></a> [tariff\_admin\_oauth\_secret](#input\_tariff\_admin\_oauth\_secret) | Admin tool OAuth secret. | `string` | n/a | yes |
| <a name="input_tariff_admin_secret_key_base"></a> [tariff\_admin\_secret\_key\_base](#input\_tariff\_admin\_secret\_key\_base) | Admin tool secret key base. | `string` | n/a | yes |
| <a name="input_tariff_admin_sentry_dsn"></a> [tariff\_admin\_sentry\_dsn](#input\_tariff\_admin\_sentry\_dsn) | Admin tool Sentry DSN. | `string` | n/a | yes |
| <a name="input_tariff_backend_secret_key_base"></a> [tariff\_backend\_secret\_key\_base](#input\_tariff\_backend\_secret\_key\_base) | Backend secret key base. | `string` | n/a | yes |
| <a name="input_tariff_backend_sentry_dsn"></a> [tariff\_backend\_sentry\_dsn](#input\_tariff\_backend\_sentry\_dsn) | Backend Sentry DSN. | `string` | n/a | yes |
| <a name="input_tariff_duty_calculator_secret_key_base"></a> [tariff\_duty\_calculator\_secret\_key\_base](#input\_tariff\_duty\_calculator\_secret\_key\_base) | Duty calculator secret key base. | `string` | n/a | yes |
| <a name="input_tariff_duty_calculator_sentry_dsn"></a> [tariff\_duty\_calculator\_sentry\_dsn](#input\_tariff\_duty\_calculator\_sentry\_dsn) | Duty calculator Sentry DSN. | `string` | n/a | yes |
| <a name="input_tariff_frontend_secret_key_base"></a> [tariff\_frontend\_secret\_key\_base](#input\_tariff\_frontend\_secret\_key\_base) | Frontend secret key base. | `string` | n/a | yes |
| <a name="input_tariff_frontend_sentry_dsn"></a> [tariff\_frontend\_sentry\_dsn](#input\_tariff\_frontend\_sentry\_dsn) | Frontend Sentry DSN. | `string` | n/a | yes |
| <a name="input_tariff_search_query_parser_sentry_dsn"></a> [tariff\_search\_query\_parser\_sentry\_dsn](#input\_tariff\_search\_query\_parser\_sentry\_dsn) | Search query parser Sentry DSN. | `string` | n/a | yes |
| <a name="input_waf_rpm_limit"></a> [waf\_rpm\_limit](#input\_waf\_rpm\_limit) | Request per minute limit for the WAF. | `number` | `100` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
