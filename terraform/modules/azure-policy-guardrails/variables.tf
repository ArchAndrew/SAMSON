variable "management_group_id" {
  description = "Azure management group ID where the policy initiative will be assigned."
  type        = string
}

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

variable "allowed_locations" {
  description = "Allowed Azure regions."
  type        = list(string)
  default     = ["eastus", "eastus2"]
}

variable "required_tags" {
  description = "Required tags for Azure resources."
  type        = list(string)
  default     = ["Environment", "Project", "Owner"]
}