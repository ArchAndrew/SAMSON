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

variable "approved_region" {
  description = "Approved AWS region used for validation."
  type        = string
  default     = "us-east-1"
}

variable "unapproved_region" {
  description = "Unapproved AWS region used for SCP validation testing."
  type        = string
  default     = "us-west-1"
}