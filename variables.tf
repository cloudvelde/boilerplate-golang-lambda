variable "lambda_name" {
  type        = string
  description = "Name of the deployed lambda function"
  default     = "boilerplate"
}

variable "filename" {
  type        = string
  description = "Name of zip to be uploaded"
  default     = "lambda.zip"
}

variable "lambda_handler" {
  type        = string
  description = "Name of go binary in zip file"
  default     = "main"
}

variable "aws_region" {
  type        = string
  description = "Name of AWS Region to be deployed"
  default     = "eu-central-1"
}

variable "lambda_memory" {
  type        = number
  description = "Lambda memory allocation in MB"
  default     = 256
}

variable "concurrent_lambdas" {
  type        = number
  description = "Number of concurrent lambdas, AWS default is 1000"
  default     = 1
}

variable "lambda_environment_vars" {
  type        = map(string)
  description = "Environment varialbes for lambda runtime"
}
