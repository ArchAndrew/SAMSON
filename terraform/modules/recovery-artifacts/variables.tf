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

variable "state_bucket_name" {
  description = "Terraform state bucket name."
  type        = string
  default     = "samson-terraform-state-14412"
}