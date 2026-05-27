resource "aws_organizations_policy" "deny_unapproved_regions" {
  name        = "${var.project}-${var.environment}-deny-unapproved-regions"
  description = "Deny actions outside approved AWS regions."
  type        = "SERVICE_CONTROL_POLICY"
  content     = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "DenyUnapprovedRegions"
        Effect = "Deny"
        NotAction = [
          "iam:*",
          "organizations:*",
          "route53:*",
          "cloudfront:*",
          "support:*",
          "budgets:*",
          "ce:*"
        ]
        Resource = "*"
        Condition = {
          StringNotEquals = {
            "aws:RequestedRegion" = var.approved_regions
          }
        }
      }
    ]
  })
}

resource "aws_organizations_policy" "deny_root_user_actions" {
  name        = "${var.project}-${var.environment}-deny-root-user-actions"
  description = "Deny most actions when performed by the root user."
  type        = "SERVICE_CONTROL_POLICY"
  content     = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid      = "DenyRootUserActions"
        Effect   = "Deny"
        Action   = "*"
        Resource = "*"
        Condition = {
          StringLike = {
            "aws:PrincipalArn" = "arn:aws:iam::*:root"
          }
        }
      }
    ]
  })
}

resource "aws_organizations_policy_attachment" "deny_unapproved_regions" {
  policy_id = aws_organizations_policy.deny_unapproved_regions.id
  target_id = var.target_id
}

resource "aws_organizations_policy_attachment" "deny_root_user_actions" {
  policy_id = aws_organizations_policy.deny_root_user_actions.id
  target_id = var.target_id
}