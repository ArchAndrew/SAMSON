variable "project" {
  type    = string
  default = "SAMSON"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "lambda_source_dir" {
  type = string
}

variable "event_bus_name" {
  type = string
}

variable "splunk_hec_url" {
  description = "Splunk HEC endpoint URL."
  type        = string
}

variable "splunk_hec_token_parameter_name" {
  description = "SSM Parameter name containing the Splunk HEC token."
  type        = string
}

variable "splunk_hec_token_parameter_arn" {
  description = "SSM Parameter ARN containing the Splunk HEC token."
  type        = string
}

variable "splunk_index" {
  type    = string
  default = "main"
}

variable "splunk_sourcetype" {
  type    = string
  default = "samson:risk:event"
}

variable "lambda_timeout" {
  type    = number
  default = 30
}

variable "lambda_memory" {
  type    = number
  default = 256
}

variable "tags" {
  type    = map(string)
  default = {}
}