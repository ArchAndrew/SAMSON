terraform {
  backend "s3" {
    bucket       = "samson-terraform-state-14412"
    key          = "samson/dev/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}