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

variable "primary_region" {
  description = "Primary operating AWS region."
  type        = string
  default     = "us-east-1"
}

variable "recovery_region" {
  description = "Secondary recovery AWS region."
  type        = string
  default     = "us-east-2"
}