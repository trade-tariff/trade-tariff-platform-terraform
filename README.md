# trade-tariff-platform-terraform

Repository to store the Terraform for AWS infrastructure.

[![CircleCI](https://dl.circleci.com/status-badge/img/gh/trade-tariff/trade-tariff-platform-terraform/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/trade-tariff/trade-tariff-platform-terraform/tree/main)

## Making changes

Any changes to the infrastructure must go through the pull request process.
Terraform commands are run in CI automatically when commits are pushed to a
branch, and the plan output is posted as a comment to an opened pull request.

Once the changes are merged into main, they will be applied against development
and staging environments (with smoke tests run against each). There is a manual
gate against the production environment.

## Running locally

Much of the configuration can be tested via the use of the included
[pre-commit](https://pre-commit.com/) hooks. It is recommended to run these
as it will run `terraform fmt` and `validate` steps against your changes,
catching any errors.

Due to the number of variables in this repository, it is not recommended to run
Terraform commands locally. To avoid having to input variables manually when
running commands, consider creating `.tfvars` files for this purpose. They
are `gitignore`d and should not be committed to this repository.

If you need to run plans/applies locally, you will need **AWS credentials**
configured before you can do so.

## Environment separation

This configuration makes use of a ["partial"](https://developer.hashicorp.com/terraform/language/settings/backends/configuration#partial-configuration)
backend, and the `-backend-config=PATH` switch to use separate backends. These
can be found in the `/backends` subdirectory. For example, running against
`development` is done like so:

```sh
terraform plan -backend-config=backends/development.tfbackend
```

The environments: `development`, `staging`, and `production`, have separate
variables for changing the configuration on each environment. Different CircleCi
contexts are used for each environment.

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
| [aws_s3_bucket_acl.this](https://registry.terraform.io/providers/hashicorp/aws/4.61.0/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_public_access_block.this](https://registry.terraform.io/providers/hashicorp/aws/4.61.0/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_cloudfront_cache_policy.caching_disabled](https://registry.terraform.io/providers/hashicorp/aws/4.61.0/docs/data-sources/cloudfront_cache_policy) | data source |
| [aws_route53_zone.selected](https://registry.terraform.io/providers/hashicorp/aws/4.61.0/docs/data-sources/route53_zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Deployment environment. | `string` | `"eu-west-2"` | no |
| <a name="input_new_relic_licence_key"></a> [new\_relic\_licence\_key](#input\_new\_relic\_licence\_key) | New Relic API key. | `string` | n/a | yes |
| <a name="input_tariff_admin_bearer_token"></a> [tariff\_admin\_bearer\_token](#input\_tariff\_admin\_bearer\_token) | Admin tool bearer token. | `string` | n/a | yes |
| <a name="input_tariff_admin_oauth_id"></a> [tariff\_admin\_oauth\_id](#input\_tariff\_admin\_oauth\_id) | Admin tool OAuth ID. | `string` | n/a | yes |
| <a name="input_tariff_admin_oauth_secret"></a> [tariff\_admin\_oauth\_secret](#input\_tariff\_admin\_oauth\_secret) | Admin tool OAuth secret. | `string` | n/a | yes |
| <a name="input_tariff_admin_secret_key_base"></a> [tariff\_admin\_secret\_key\_base](#input\_tariff\_admin\_secret\_key\_base) | Admin tool secret key base. | `string` | n/a | yes |
| <a name="input_tariff_admin_sentry_dsn"></a> [tariff\_admin\_sentry\_dsn](#input\_tariff\_admin\_sentry\_dsn) | Admin tool Sentry DSN. | `string` | n/a | yes |
| <a name="input_tariff_backend_oauth_id"></a> [tariff\_backend\_oauth\_id](#input\_tariff\_backend\_oauth\_id) | Tariff Backend OAuth ID. | `string` | n/a | yes |
| <a name="input_tariff_backend_oauth_secret"></a> [tariff\_backend\_oauth\_secret](#input\_tariff\_backend\_oauth\_secret) | Tariff Backend OAuth secret. | `string` | n/a | yes |
| <a name="input_tariff_backend_secret_key_base"></a> [tariff\_backend\_secret\_key\_base](#input\_tariff\_backend\_secret\_key\_base) | Backend secret key base. | `string` | n/a | yes |
| <a name="input_tariff_backend_sentry_dsn"></a> [tariff\_backend\_sentry\_dsn](#input\_tariff\_backend\_sentry\_dsn) | Backend Sentry DSN. | `string` | n/a | yes |
| <a name="input_tariff_backend_sync_email"></a> [tariff\_backend\_sync\_email](#input\_tariff\_backend\_sync\_email) | Tariff Sync email. | `string` | n/a | yes |
| <a name="input_tariff_backend_sync_host"></a> [tariff\_backend\_sync\_host](#input\_tariff\_backend\_sync\_host) | Tariff Sync host. | `string` | n/a | yes |
| <a name="input_tariff_backend_sync_password"></a> [tariff\_backend\_sync\_password](#input\_tariff\_backend\_sync\_password) | Tariff Sync password. | `string` | n/a | yes |
| <a name="input_tariff_backend_sync_username"></a> [tariff\_backend\_sync\_username](#input\_tariff\_backend\_sync\_username) | Tariff Sync username. | `string` | n/a | yes |
| <a name="input_tariff_duty_calculator_secret_key_base"></a> [tariff\_duty\_calculator\_secret\_key\_base](#input\_tariff\_duty\_calculator\_secret\_key\_base) | Duty calculator secret key base. | `string` | n/a | yes |
| <a name="input_tariff_duty_calculator_sentry_dsn"></a> [tariff\_duty\_calculator\_sentry\_dsn](#input\_tariff\_duty\_calculator\_sentry\_dsn) | Duty calculator Sentry DSN. | `string` | n/a | yes |
| <a name="input_tariff_frontend_secret_key_base"></a> [tariff\_frontend\_secret\_key\_base](#input\_tariff\_frontend\_secret\_key\_base) | Frontend secret key base. | `string` | n/a | yes |
| <a name="input_tariff_frontend_sentry_dsn"></a> [tariff\_frontend\_sentry\_dsn](#input\_tariff\_frontend\_sentry\_dsn) | Frontend Sentry DSN. | `string` | n/a | yes |
| <a name="input_tariff_search_query_parser_sentry_dsn"></a> [tariff\_search\_query\_parser\_sentry\_dsn](#input\_tariff\_search\_query\_parser\_sentry\_dsn) | Search query parser Sentry DSN. | `string` | n/a | yes |
| <a name="input_tariff_signon_active_record_derivation_salt"></a> [tariff\_signon\_active\_record\_derivation\_salt](#input\_tariff\_signon\_active\_record\_derivation\_salt) | Tariff Signon Active Record Encryption Key Derivation Salt. | `string` | n/a | yes |
| <a name="input_tariff_signon_active_record_primary_key"></a> [tariff\_signon\_active\_record\_primary\_key](#input\_tariff\_signon\_active\_record\_primary\_key) | Tariff Signon Active Record Encryption Primary Key. | `string` | n/a | yes |
| <a name="input_tariff_signon_devise_pepper"></a> [tariff\_signon\_devise\_pepper](#input\_tariff\_signon\_devise\_pepper) | Tariff Signon Devise Pepper. | `string` | n/a | yes |
| <a name="input_tariff_signon_devise_secret_key"></a> [tariff\_signon\_devise\_secret\_key](#input\_tariff\_signon\_devise\_secret\_key) | Tariff Signon Devise Secret Key. | `string` | n/a | yes |
| <a name="input_tariff_signon_redis_url"></a> [tariff\_signon\_redis\_url](#input\_tariff\_signon\_redis\_url) | Tariff Signon Redis URL. | `string` | n/a | yes |
| <a name="input_tariff_signon_secret_key_base"></a> [tariff\_signon\_secret\_key\_base](#input\_tariff\_signon\_secret\_key\_base) | Tariff Signon Secret Key Base. | `string` | n/a | yes |
| <a name="input_waf_rpm_limit"></a> [waf\_rpm\_limit](#input\_waf\_rpm\_limit) | Request per minute limit for the WAF. | `number` | `100` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
