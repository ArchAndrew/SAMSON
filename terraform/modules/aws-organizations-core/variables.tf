variable "aws_service_access_principals" {
  description = "AWS service principals allowed to integrate with AWS Organizations."
  type        = list(string)

  default = [
    "cloudtrail.amazonaws.com",
    "config.amazonaws.com",
    "guardduty.amazonaws.com",
    "securityhub.amazonaws.com",
    "access-analyzer.amazonaws.com"
  ]
}

variable "enabled_policy_types" {
  description = "Organization policy types enabled at the root."
  type        = list(string)

  default = [
    "SERVICE_CONTROL_POLICY"
  ]
}

variable "security_ou_name" {
  description = "Name of the Security OU."
  type        = string
  default     = "Security"
}

variable "shared_services_ou_name" {
  description = "Name of the Shared Services OU."
  type        = string
  default     = "Shared-Services"
}

variable "workloads_ou_name" {
  description = "Name of the Workloads OU."
  type        = string
  default     = "Workloads"
}

variable "sandbox_ou_name" {
  description = "Name of the Sandbox OU."
  type        = string
  default     = "Sandbox"
}