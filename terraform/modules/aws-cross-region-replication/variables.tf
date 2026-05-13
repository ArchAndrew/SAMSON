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

variable "primary_bucket_name" {
  description = "Primary S3 evidence bucket name."
  type        = string
}

variable "replica_bucket_name" {
  description = "Replica S3 evidence bucket name."
  type        = string
}

variable "tags" {
  description = "Standardized resource tags."
  type        = map(string)
  default     = {}
}