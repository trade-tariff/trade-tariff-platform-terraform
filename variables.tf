variable "environment" {
  description = "Deployment environment."
  type        = string
}

variable "waf_rpm_limit" {
  description = "Request per minute limit for the WAF."
  type        = number
  default     = 100
}

variable "new_relic_licence_key" {
  description = "New Relic API key."
  type        = string
  sensitive   = true
}

variable "opensearch_master_username" {
  description = "Opensearch cluster master user username."
  type        = string
  sensitive   = true
}
variable "opensearch_master_password" {
  description = "Opensearch cluster master user password."
  type        = string
  sensitive   = true
}
