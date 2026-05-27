locals {
  required_tags = {
    Project            = var.project
    Environment        = var.environment
    Owner              = var.owner
    CostCenter         = var.cost_center
    DataClassification = var.data_classification
    ComplianceScope    = var.compliance_scope
    ManagedBy          = "Terraform"
    Repository         = "SAMSON"
  }

  merged_tags = merge(local.required_tags, var.additional_tags)
}