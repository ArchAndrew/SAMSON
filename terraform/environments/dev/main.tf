module "aws_organizations_core" {
  source = "../../modules/aws-organizations-core"
}
module "tagging_standards" {
  source = "../../modules/tagging-standards"

  project             = "SAMSON"
  environment         = "dev"
  owner               = "thee_architect_was_here"
  cost_center         = "SecurityEngineering"
  data_classification = "Confidential"
  compliance_scope    = "HIPAA-NIST-800-53-ISO-27001"
}

module "backend_bootstrap" {
  source      = "../../modules/backend-bootstrap"
  bucket_name = "samson-terraform-state-14412"

  tags = module.tagging_standards.merged_tags
}