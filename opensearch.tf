module "opensearch" {
  source = "git@github.com:trade-tariff/trade-tariff-platform-terraform-modules.git//aws/opensearch?ref=aws/opensearch-v1.0.0"

  cluster_name    = "tariff-search-${var.environment}"
  cluster_domain  = local.base_url
  cluster_version = "2.3"

  master_instance_enabled = false
  warm_instance_enabled   = false
  instance_count          = 3
  instance_type           = "m6g.xlarge.search"
  ebs_volume_size         = 80

  create_master_user = true

  ssm_secret_name = "/${var.environment}/common/ELASTICSEARCH_URL"
}
