module "aws_organizations_core" {
  source = "../../modules/aws-organizations-core"
}

module "backend_bootstrap" {
  source      = "../../modules/backend-bootstrap"
  bucket_name = "samson-terraform-state-14412"

  tags = {
    Project     = "SAMSON"
    Environment = "dev"
    Owner       = "thee_architect_was_here"
  }
}