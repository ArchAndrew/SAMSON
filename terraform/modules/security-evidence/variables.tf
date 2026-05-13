variable "project" {
  description = "Project name."
  type        = string
}

variable "environment" {
  description = "Deployment environment."
  type        = string
}

variable "primary_bucket_name" {
  description = "Primary evidence bucket name."
  type        = string
}

variable "replica_bucket_name" {
  description = "Replica evidence bucket name."
  type        = string
}

variable "retention_days" {
  description = "Number of days to retain evidence before transitioning or expiration."
  type        = number
  default     = 365
}

variable "dr_strategy" {
  description = "Disaster recovery strategy."
  type        = string
  default     = "Pilot Light"
}

variable "rpo_minutes" {
  description = "Recovery Point Objective in minutes."
  type        = number
  default     = 15
}

variable "rto_hours" {
  description = "Recovery Time Objective in hours."
  type        = number
  default     = 4
}

variable "tags" {
  description = "Tags applied to all resources."
  type        = map(string)
  default     = {}
}