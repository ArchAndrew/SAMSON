resource "aws_iam_role" "ssm_automation" {
  name = "${var.project}-${var.environment}-ssm-automation-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ssm.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })

  tags = var.tags
}

resource "aws_iam_policy" "ssm_automation" {
  name        = "${var.project}-${var.environment}-ssm-automation-policy"
  description = "Allows SAMSON SSM automation runbooks to perform controlled identity remediation."

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "iam:UpdateAccessKey",
          "iam:ListAccessKeys",
          "iam:GetUser"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "ssm:StartAutomationExecution",
          "ssm:GetAutomationExecution"
        ]
        Resource = "*"
      }
    ]
  })

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "ssm_automation" {
  role       = aws_iam_role.ssm_automation.name
  policy_arn = aws_iam_policy.ssm_automation.arn
}

resource "aws_ssm_document" "disable_access_key" {
  name            = "${var.project}-${var.environment}-disable-access-key"
  document_type   = "Automation"
  document_format = "YAML"

  content = yamlencode({
    schemaVersion = "0.3"
    description   = "Disable a suspicious IAM access key as a controlled SAMSON remediation action."

    assumeRole = "{{ AutomationAssumeRole }}"

    parameters = {
      AutomationAssumeRole = {
        type        = "String"
        description = "IAM role ARN assumed by Systems Manager Automation."
      }

      UserName = {
        type        = "String"
        description = "IAM user name associated with the access key."
      }

      AccessKeyId = {
        type        = "String"
        description = "Access key ID to disable."
      }
    }

    mainSteps = [
      {
        name   = "DisableAccessKey"
        action = "aws:executeAwsApi"
        inputs = {
          Service     = "iam"
          Api         = "UpdateAccessKey"
          UserName    = "{{ UserName }}"
          AccessKeyId = "{{ AccessKeyId }}"
          Status      = "Inactive"
        }
      }
    ]
  })

  tags = var.tags
}