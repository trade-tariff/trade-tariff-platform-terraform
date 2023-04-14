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

  create_master_user   = false
  master_user_username = var.opensearch_master_username
  master_user_password = var.opensearch_master_password

  # TODO: move to /env/common/ELASTICSEARCH_URL
  ssm_secret_name = "/${var.environment}/ELASTICSEARCH_URL"

  tags = local.tags
}
