provider "aws" {
  region = "eu-central-1"
}

variable "filename" {
  default = "lambda.zip"
}

data "archive_file" "lambda" {
  type = "zip"
  source_file = "main"
  output_path = "lambda.zip"
}

resource "aws_iam_role" "boilerplate" {
  name = "boilerplate"

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

resource "aws_lambda_function" "boilerplate" {
  function_name = "boilerplate"
  handler = "main"
  role = aws_iam_role.boilerplate.arn
  runtime = "go1.x"

  filename = var.filename
  source_code_hash = filebase64sha256(var.filename)

  environment {
    variables = {
      key = "value"
    }
  }
}