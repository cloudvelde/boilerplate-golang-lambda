
provider "aws" {
  region = var.aws_region
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "main"
  output_path = "lambda.zip"
}

resource "aws_iam_role" "boilerplate" {
  name = "${var.lambda_name}-role"
  managed_policy_arns = [
    aws_iam_policy.lambda_kmsRead.arn,
    aws_iam_policy.lambda_cloudwatch.arn,
  ]

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

# You MUST have this if custom environment variables are used
resource "aws_iam_policy" "lambda_kmsRead" {
  name = "${var.lambda_name}-kmsRead"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "kms:GetParametersForImport",
        ],
        Effect = "Allow"
        "Resource" : "arn:aws:kms:*"
      },
    ]
  })
}

# Minimum cloud watch settings needed for lambda debugging
resource "aws_iam_policy" "lambda_cloudwatch" {
  name = "${var.lambda_name}-cloudwatch"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "logs:CreateLogStream",
          "logs:GetLogDelivery",
          "logs:DescribeDestinations",
          "logs:PutLogEvents",
        ],
        Effect = "Allow"
        "Resource" : "*"
      },
    ]
  })
}


resource "aws_lambda_function" "boilerplate" {
  function_name                  = var.lambda_name
  handler                        = var.lambda_handler
  role                           = aws_iam_role.boilerplate.arn
  runtime                        = "go1.x"
  memory_size                    = var.lambda_memory
  reserved_concurrent_executions = 1

  filename         = var.filename
  source_code_hash = filebase64sha256(var.filename)

  environment {
    variables = var.lambda_environment_vars
  }
}
