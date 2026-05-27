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

variable "monthly_budget_limit" {
  description = "Monthly budget limit in USD."
  type        = number
  default     = 120
}

variable "actual_threshold" {
  description = "Actual spend alert threshold as a percentage of the budget."
  type        = number
  default     = 100
}

variable "forecast_threshold" {
  description = "Forecasted spend warning threshold as a percentage of the budget."
  type        = number
  default     = 125
}

variable "emergency_threshold" {
  description = "Forecasted spend critical threshold as a percentage of the budget."
  type        = number
  default     = 146
}

variable "notification_emails" {
  description = "Email addresses to receive budget alerts."
  type        = list(string)
}

variable "tags" {
  description = "Standardized tags (accepted for interface consistency). AWS Budgets does not support tags on the budget resource."
  type        = map(string)
  default     = {}
}