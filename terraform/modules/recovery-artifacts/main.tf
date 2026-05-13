locals {
  recovery_artifacts = {
    terraform_state = {
      description = "Terraform remote state stored in Amazon S3."
      location    = "s3://samson-terraform-state-14412/samson/dev/terraform.tfstate"
      priority    = "Critical"
    }

    aws_organizations = {
      description = "AWS Organizations configuration, OUs, and governance hierarchy."
      priority    = "Critical"
    }

    service_control_policies = {
      description = "Service Control Policies enforcing preventive security guardrails."
      priority    = "Critical"
    }

    compliance_mappings = {
      description = "Control-to-framework mappings for NIST, ISO 27001, HIPAA, and CIS."
      priority    = "High"
    }

    policy_simulation_tests = {
      description = "Policy-as-code validation scenarios for governance testing."
      priority    = "High"
    }

    security_evidence = {
      description = "Cloud security evidence and forensic artifacts retained in immutable storage."
      priority    = "Critical"
    }
  }

  recovery_objectives = {
    dr_strategy = "Pilot Light"
    rto_hours   = 4
    rpo_minutes = 15
    status      = "Defined"
  }
}