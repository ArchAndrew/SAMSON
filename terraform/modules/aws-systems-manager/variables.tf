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

variable "tags" {
  description = "Standardized resource tags."
  type        = map(string)
  default     = {}
}