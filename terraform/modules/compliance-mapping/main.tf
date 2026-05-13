locals {
  control_mappings = {
    terraform_remote_state_encryption = {
      control_name = "Terraform Remote State Encryption"
      description  = "Encrypts Terraform state stored in Amazon S3."
      frameworks = {
        nist_800_53 = ["SC-13", "SC-28"]
        iso_27001   = ["A.8.24", "A.8.12"]
        hipaa       = ["164.312(a)(2)(iv)"]
        cis         = ["CIS Control 3", "CIS Control 8"]
      }
    }

    s3_state_versioning = {
      control_name = "S3 State Versioning"
      description  = "Preserves historical versions of Terraform state for recovery."
      frameworks = {
        nist_800_53 = ["CP-9", "CP-10"]
        iso_27001   = ["A.8.13"]
        hipaa       = ["164.308(a)(7)(ii)(A)"]
        cis         = ["CIS Control 11"]
      }
    }

    corporate_tagging = {
      control_name = "Corporate Tagging Standards"
      description  = "Applies standardized metadata for ownership, cost, classification, and compliance scope."
      frameworks = {
        nist_800_53 = ["CM-8", "RA-3"]
        iso_27001   = ["A.5.9", "A.5.12"]
        hipaa       = ["164.308(a)(1)(ii)(A)"]
        cis         = ["CIS Control 1"]
      }
    }

    budget_guardrails = {
      control_name = "Budget Guardrails"
      description  = "Implements monthly cost thresholds and alerting."
      frameworks = {
        nist_800_53 = ["AU-6", "CA-7"]
        iso_27001   = ["A.5.36"]
        hipaa       = ["164.308(a)(1)(ii)(D)"]
        cis         = ["CIS Control 8"]
      }
    }

    scp_region_restriction = {
      control_name = "SCP Region Restriction"
      description  = "Restricts AWS activity to approved regions."
      frameworks = {
        nist_800_53 = ["AC-6", "SC-7"]
        iso_27001   = ["A.5.15", "A.8.20"]
        hipaa       = ["164.312(a)(1)"]
        cis         = ["CIS Control 4"]
      }
    }

    scp_root_user_restriction = {
      control_name = "SCP Root User Restriction"
      description  = "Denies high-risk root user actions through AWS Organizations SCPs."
      frameworks = {
        nist_800_53 = ["AC-2", "AC-6"]
        iso_27001   = ["A.5.16", "A.5.18"]
        hipaa       = ["164.308(a)(4)(ii)(B)"]
        cis         = ["CIS Control 5"]
      }
    }

    scp_validation = {
      control_name = "SCP Validation"
      description  = "Validates governance controls by detecting SCP presence and FullAWSAccess risk."
      frameworks = {
        nist_800_53 = ["CA-7", "RA-5"]
        iso_27001   = ["A.8.8", "A.5.35"]
        hipaa       = ["164.308(a)(8)"]
        cis         = ["CIS Control 8"]
      }
    }

    policy_simulation = {
      control_name = "Policy Simulation"
      description  = "Defines expected authorization outcomes for policy-as-code testing."
      frameworks = {
        nist_800_53 = ["CA-7", "RA-5"]
        iso_27001   = ["A.8.8", "A.5.35"]
        hipaa       = ["164.308(a)(8)"]
        cis         = ["CIS Control 8"]
      }
    }
  }

  summary = {
    project        = var.project
    environment    = var.environment
    control_count  = length(local.control_mappings)
    frameworks     = ["NIST-800-53", "ISO-27001", "HIPAA", "CIS"]
    mapping_status = "defined"
  }
}