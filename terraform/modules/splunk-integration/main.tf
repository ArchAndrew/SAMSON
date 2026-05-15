resource "aws_iam_role" "splunk_forwarder" {
  name = "${var.project}-${var.environment}-splunk-forwarder-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = { Service = "lambda.amazonaws.com" }
      Action = "sts:AssumeRole"
    }]
  })

  tags = var.tags
}

resource "aws_iam_policy" "splunk_forwarder" {
  name        = "${var.project}-${var.environment}-splunk-forwarder-policy"
  description = "Permissions for SAMSON Splunk HEC forwarder."

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
        Action = ["ssm:GetParameter"]
        Resource = var.splunk_hec_token_parameter_arn
      },
      {
        Effect = "Allow"
        Action = ["kms:Decrypt"]
        Resource = "*"
      }
    ]
  })

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "splunk_forwarder" {
  role       = aws_iam_role.splunk_forwarder.name
  policy_arn = aws_iam_policy.splunk_forwarder.arn
}

data "archive_file" "splunk_forwarder_package" {
  type        = "zip"
  source_dir  = var.lambda_source_dir
  output_path = "${path.module}/splunk_forwarder.zip"
}

resource "aws_lambda_function" "splunk_forwarder" {
  function_name = "${var.project}-${var.environment}-splunk-forwarder"
  role          = aws_iam_role.splunk_forwarder.arn
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.12"
  timeout       = var.lambda_timeout
  memory_size   = var.lambda_memory

  filename         = data.archive_file.splunk_forwarder_package.output_path
  source_code_hash = data.archive_file.splunk_forwarder_package.output_base64sha256

  environment {
    variables = {
      PROJECT                    = var.project
      ENVIRONMENT                = var.environment
      SPLUNK_HEC_URL             = var.splunk_hec_url
      SPLUNK_HEC_TOKEN_PARAMETER = var.splunk_hec_token_parameter_name
      SPLUNK_INDEX               = var.splunk_index
      SPLUNK_SOURCETYPE          = var.splunk_sourcetype
    }
  }

  depends_on = [aws_iam_role_policy_attachment.splunk_forwarder]

  tags = var.tags
}

resource "aws_lambda_permission" "allow_eventbridge" {
  statement_id  = "AllowExecutionFromEventBridgeSplunkForwarder"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.splunk_forwarder.function_name
  principal     = "events.amazonaws.com"
}

resource "aws_cloudwatch_event_rule" "risk_events_to_splunk" {
  name           = "${var.project}-${var.environment}-risk-events-to-splunk"
  description    = "Routes SAMSON risk and response events to Splunk."
  event_bus_name = var.event_bus_name

  event_pattern = jsonencode({
    source = ["samson.risk-engine", "samson.response-workflows"]
  })

  tags = var.tags
}

resource "aws_cloudwatch_event_target" "splunk_forwarder" {
  rule           = aws_cloudwatch_event_rule.risk_events_to_splunk.name
  event_bus_name = var.event_bus_name
  target_id      = "splunk-forwarder"
  arn            = aws_lambda_function.splunk_forwarder.arn
}