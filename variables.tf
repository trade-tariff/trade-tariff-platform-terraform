variable "environment" {
  description = "Deployment environment."
  type        = string
}

variable "waf_rpm_limit" {
  description = "Request per minute limit for the WAF."
  type        = number
  default     = 100
}
