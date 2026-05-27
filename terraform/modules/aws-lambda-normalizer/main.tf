resource "aws_iam_role" "lambda_normalizer" {
  name = "${var.project}-${var.environment}-lambda-normalizer-role"

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

resource "aws_iam_policy" "lambda_normalizer" {
  name        = "${var.project}-${var.environment}-lambda-normalizer-policy"
  description = "Permissions for SAMSON event normalization Lambda."

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

resource "aws_iam_role_policy_attachment" "lambda_normalizer" {
  role       = aws_iam_role.lambda_normalizer.name
  policy_arn = aws_iam_policy.lambda_normalizer.arn
}

data "archive_file" "lambda_package" {
  type        = "zip"
  source_dir  = var.lambda_source_dir
  output_path = "${path.module}/lambda_normalizer.zip"
}

resource "aws_lambda_function" "normalizer" {
  function_name = "${var.project}-${var.environment}-lambda-normalizer"
  role          = aws_iam_role.lambda_normalizer.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.12"
  timeout       = var.lambda_timeout
  memory_size   = var.lambda_memory

  filename         = data.archive_file.lambda_package.output_path
  source_code_hash = data.archive_file.lambda_package.output_base64sha256

  environment {
    variables = {
      PROJECT              = var.project
      ENVIRONMENT          = var.environment
      EVIDENCE_BUCKET_NAME = var.evidence_bucket_name
      EVENT_BUS_NAME       = var.event_bus_name
    }
  }

  depends_on = [
    aws_iam_role_policy_attachment.lambda_normalizer
  ]

  tags = var.tags
}

resource "aws_lambda_permission" "allow_eventbridge" {
  statement_id  = "AllowExecutionFromEventBridge"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.normalizer.function_name
  principal     = "events.amazonaws.com"
}