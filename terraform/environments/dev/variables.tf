variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "aws_replica_region" {
  description = "Secondary AWS recovery region."
  type        = string
  default     = "us-east-2"
}

variable "splunk_hec_url" {
  description = "Splunk HEC endpoint URL."
  type        = string
  sensitive   = true
}

variable "splunk_hec_token_parameter_name" {
  description = "SSM Parameter name storing the Splunk HEC token."
  type        = string
  sensitive   = true
}

variable "splunk_hec_token_parameter_arn" {
  description = "SSM Parameter ARN storing the Splunk HEC token."
  type        = string
  sensitive   = true
}


variable "azure_subscription_id" {
  description = "Azure subscription ID."
  type        = string
}


