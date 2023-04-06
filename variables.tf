variable "environment" {
  description = "Deployment environment."
  type        = string
  default     = "eu-west-2"
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
