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

variable "target_id" {
  description = "AWS Organizations target ID where SCPs are attached. This can be a Root ID, OU ID, or Account ID."
  type        = string
}

variable "approved_regions" {
  description = "Approved AWS regions."
  type        = list(string)
  default     = ["us-east-1", "us-east-2"]
}