module "ssm" {
  source = "git@github.com:trade-tariff/trade-tariff-platform-terraform-modules.git//aws/ssm?ref=aws/ssm-v1.0.0"

  parameters = flatten([
    local.admin_tool_vars,
    local.common_vars,
    local.backend_common_vars,
    local.backend_uk_vars,
    local.backend_xi_vars,
    local.duty_calculator_vars,
    local.frontend_vars,
    local.search_query_parser_vars,
    [var.environment == "development" ? local.signon_vars : []]
  ])
}
