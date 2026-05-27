variable "project" {
  description = "Project name."
  type        = string
  default     = "SAMSON"
}

variable "environment" {
  description = "Deployment environment."
  type        = string
  default     = "dev"
}

variable "lambda_source_dir" {
  description = "Path to response workflow source code directory."
  type        = string
}

variable "evidence_bucket_name" {
  description = "Primary evidence bucket name."
  type        = string
}

variable "evidence_bucket_arn" {
  description = "Primary evidence bucket ARN."
  type        = string
}

variable "event_bus_name" {
  description = "SAMSON EventBridge bus name."
  type        = string
}

variable "event_bus_arn" {
  description = "SAMSON EventBridge bus ARN."
  type        = string
}

variable "notification_emails" {
  description = "Email addresses for response notifications."
  type        = list(string)
  default     = []
}

variable "autonomy_mode" {
  description = "Controls remediation behavior. Recommended values: monitor, approval_required, autonomous."
  type        = string
  default     = "approval_required"
}

variable "lambda_timeout" {
  description = "Lambda timeout in seconds."
  type        = number
  default     = 30
}

variable "lambda_memory" {
  description = "Lambda memory size in MB."
  type        = number
  default     = 256
}

variable "tags" {
  description = "Standardized resource tags."
  type        = map(string)
  default     = {}
}