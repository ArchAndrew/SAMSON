#This tells Terraform the child module intentionally uses: provider = aws.replica

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      configuration_aliases = [aws.replica]
    }
  }
}