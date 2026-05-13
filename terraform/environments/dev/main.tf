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

module "budget_guardrails" {
  source = "../../modules/budget-guardrails"

  project     = "SAMSON"
  environment = "dev"

  monthly_budget_limit = 120

  # 100% of $120 = $120 actual spend alert
  actual_threshold = 100

  # 125% of $120 = $150 forecast alert
  forecast_threshold = 125

  # 146% of $120 ≈ $175 forecast emergency alert
  emergency_threshold = 146

  notification_emails = [
    "andrew@strongtowersecurity.io"
  ]

  # Included for interface consistency across modules.
  # AWS Budgets itself does not support resource tags.
  tags = module.tagging_standards.merged_tags
}


module "aws_scp_guardrails" {
  source = "../../modules/aws-scp-guardrails"

  project     = "SAMSON"
  environment = "dev"

  target_id = module.aws_organizations_core.sandbox_ou_id

  approved_regions = [
    "us-east-1",
    "us-east-2"
  ]
}

module "aws_scp_validation" {
  source = "../../modules/aws-scp-validation"

  project     = "SAMSON"
  environment = "dev"
}

module "aws_policy_simulator" {
  source = "../../modules/aws-policy-simulator"

  project           = "SAMSON"
  environment       = "dev"
  approved_region   = "us-east-1"
  unapproved_region = "us-west-1"
}

module "compliance_mapping" {
  source = "../../modules/compliance-mapping"

  project     = "SAMSON"
  environment = "dev"
}

module "recovery_artifacts" {
  source = "../../modules/recovery-artifacts"

  project           = "SAMSON"
  environment       = "dev"
  state_bucket_name = "samson-terraform-state-14412"
}

module "dr_pilot_light" {
  source = "../../modules/dr-pilot-light"

  project         = "SAMSON"
  environment     = "dev"
  primary_region  = "us-east-1"
  recovery_region = "us-east-2"
}

module "aws_cross_region_replication" {
  source = "../../modules/aws-cross-region-replication"

  providers = {
    aws         = aws
    aws.replica = aws.replica
  }

  project             = "SAMSON"
  environment         = "dev"
  primary_bucket_name = "samson-evidence-primary-14412"
  replica_bucket_name = "samson-evidence-replica-14412"

  tags = module.tagging_standards.merged_tags
}