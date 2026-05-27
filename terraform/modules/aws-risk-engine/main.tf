resource "aws_iam_role" "risk_engine" {
  name = "${var.project}-${var.environment}-risk-engine-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })

  tags = var.tags
}

resource "aws_iam_policy" "risk_engine" {
  name        = "${var.project}-${var.environment}-risk-engine-policy"
  description = "Permissions for SAMSON deterministic risk scoring engine."

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = "*"
      },
      {
        Effect = "Allow"
        Action = [
          "s3:PutObject",
          "s3:GetObject"
        ]
        Resource = "${var.evidence_bucket_arn}/*"
      },
      {
        Effect = "Allow"
        Action = [
          "events:PutEvents"
        ]
        Resource = var.event_bus_arn
      }
    ]
  })

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "risk_engine" {
  role       = aws_iam_role.risk_engine.name
  policy_arn = aws_iam_policy.risk_engine.arn
}

data "archive_file" "risk_engine_package" {
  type        = "zip"
  source_dir  = var.lambda_source_dir
  output_path = "${path.module}/risk_engine.zip"
}

resource "aws_lambda_function" "risk_engine" {
  function_name = "${var.project}-${var.environment}-risk-engine"
  role          = aws_iam_role.risk_engine.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.12"
  timeout       = var.lambda_timeout
  memory_size   = var.lambda_memory

  filename         = data.archive_file.risk_engine_package.output_path
  source_code_hash = data.archive_file.risk_engine_package.output_base64sha256

  environment {
    variables = {
      PROJECT              = var.project
      ENVIRONMENT          = var.environment
      EVIDENCE_BUCKET_NAME = var.evidence_bucket_name
      EVENT_BUS_NAME       = var.event_bus_name
    }
  }

  depends_on = [
    aws_iam_role_policy_attachment.risk_engine
  ]

  tags = var.tags
}

resource "aws_lambda_permission" "allow_eventbridge" {
  statement_id  = "AllowExecutionFromEventBridgeRiskEngine"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.risk_engine.function_name
  principal     = "events.amazonaws.com"
}