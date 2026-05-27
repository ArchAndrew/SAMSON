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

variable "dlq_retention_seconds" {
  description = "Dead-letter queue message retention in seconds."
  type        = number
  default     = 1209600
}

variable "tags" {
  description = "Standardized resource tags."
  type        = map(string)
  default     = {}
}