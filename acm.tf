module "acm" {
  source = "git@github.com:trade-tariff/trade-tariff-platform-terraform-modules.git//aws/acm?ref=aws/cloudfront-v1.0.1"
  # Using the CF release, since that uses ACM as well :)
  # TODO: make a release of the ACM module. Maybe tidy it up too.

  domain_name               = local.cdn_alias
  subject_alternative_names = [local.api_alias]
  route53_zone_id           = data.aws_route53_zone.selected.id
}
