module "acm" {
  source = "git@github.com:trade-tariff/trade-tariff-platform-terraform-modules.git//aws/acm?ref=v0.0.2"

  domain_name               = local.cdn_aliases
  subject_alternative_names = slice(local.cdn_aliases, 1, length(local.cdn_aliases))
  route53_zone_id           = data.aws_route53_zone.selected.id
}
