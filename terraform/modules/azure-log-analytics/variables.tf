variable "project" {
  type    = string
  default = "SAMSON"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "location" {
  type    = string
  default = "eastus"
}

variable "resource_group_name" {
  type = string
}

variable "workspace_sku" {
  type    = string
  default = "PerGB2018"
}

variable "retention_in_days" {
  type    = number
  default = 30
}

variable "daily_quota_gb" {
  type    = number
  default = 1
}

variable "tags" {
  type    = map(string)
  default = {}
}