variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "aws_replica_region" {
  description = "Secondary AWS recovery region."
  type        = string
  default     = "us-east-2"
}