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

variable "owner" {
  description = "Resource owner."
  type        = string
  default     = "thee_architect_was_here"
}

variable "cost_center" {
  description = "Cost center or budget owner."
  type        = string
  default     = "SecurityEngineering"
}

variable "data_classification" {
  description = "Data sensitivity level."
  type        = string
  default     = "Confidential"
}

variable "compliance_scope" {
  description = "Applicable compliance framework."
  type        = string
  default     = "HIPAA,NIST-800-53,ISO-27001"
}

variable "additional_tags" {
  description = "Optional additional tags."
  type        = map(string)
  default     = {}
}