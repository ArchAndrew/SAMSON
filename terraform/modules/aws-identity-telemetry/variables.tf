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

variable "evidence_bucket_name" {
  description = "S3 bucket where CloudTrail logs are delivered."
  type        = string
}

variable "log_retention_days" {
  description = "CloudWatch log retention period for identity events."
  type        = number
  default     = 14
}

variable "tags" {
  description = "Standardized resource tags."
  type        = map(string)
  default     = {}
}