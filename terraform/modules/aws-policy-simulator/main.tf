locals {
  policy_simulation_tests = {
    denied_unapproved_region = {
      description     = "Validate that actions outside approved AWS regions are denied by SCP guardrails."
      expected_result = "DENY"
      action          = "ec2:RunInstances"
      region          = var.unapproved_region
    }

    allowed_approved_region = {
      description     = "Validate that actions in approved AWS regions are allowed when IAM permissions permit them."
      expected_result = "ALLOW_OR_IAM_DEPENDENT"
      action          = "ec2:DescribeInstances"
      region          = var.approved_region
    }

    deny_root_user_actions = {
      description     = "Validate that root-user actions are denied by SCP guardrails."
      expected_result = "DENY"
      action          = "iam:CreateUser"
      principal       = "root"
    }

    fullawsaccess_risk_check = {
      description     = "Document whether FullAWSAccess remains present and requires validation."
      expected_result = "REVIEW_REQUIRED"
      policy_id       = "p-FullAWSAccess"
    }
  }
}