data "aws_organizations_organization" "current" {}

data "aws_organizations_policies" "service_control_policies" {
  filter = "SERVICE_CONTROL_POLICY"
}

locals {
  fullawsaccess_present = contains(
    data.aws_organizations_policies.service_control_policies.ids,
    "p-FullAWSAccess"
  )
}