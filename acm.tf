# TODO: make a release of the ACM module.

module "cdn_certificate" {
  source          = "git@github.com:trade-tariff/trade-tariff-platform-terraform-modules.git//aws/acm?ref=aws/cloudfront-v1.0.1"
  domain_name     = local.cdn_alias
  route53_zone_id = data.aws_route53_zone.selected.id
}

module "api_certificate" {
  source          = "git@github.com:trade-tariff/trade-tariff-platform-terraform-modules.git//aws/acm?ref=aws/cloudfront-v1.0.1"
  domain_name     = local.api_alias
  route53_zone_id = data.aws_route53_zone.selected.id
}

moved {
  from = module.acm
  to   = module.cdn_certificate
}
