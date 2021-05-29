# boilerplate-golang-lambda
Just a boilerplate AWS Lambda function in golang!

### Example TF Vars
Needed to using the terraform module locally without calling as a module. Copy, paste, and edit as desired.
Name the following example `terraform.tfvars`:
```terraform 
lambda_name        = "boilerplate"
aws_region         = "eu-central-1"
lambda_memory      = 256
concurrent_lambdas = 5
lambda_environment_vars = {
  MY_CONSTANT = "foo",
  MY_PURPOSE  = "bar",
}
```

### Building
```bash
go mod tidy
go build -o main .

terraform init
terraform apply
```

### Teardown
```bash
terraform destroy
```

# Generated Module Variables

## Module Data
| Data Name |
| :--- | 
| archive_file |

## Module Resources
| Resource Name |
| :--- | 
| aws_iam_policy |
| aws_lambda_function |
| aws_iam_role |

## Module Variables
| Variable Name | Variable Description | Type | Default |
| :--- | :--- | :---: | ---: |
| lambda_name | Name of the deployed lambda function | ${string} | boilerplate |
| filename | Name of zip to be uploaded | ${string} | lambda.zip |
| lambda_handler | Name of go binary in zip file | ${string} | main |
| aws_region | Name of AWS Region to be deployed | ${string} | eu-central-1 |
| lambda_memory | Lambda memory allocation in MB | ${number} | 256 |
| concurrent_lambdas | Number of concurrent lambdas, AWS default is 1000 | ${number} | 1 |
| lambda_environment_vars | Environment varialbes for lambda runtime | ${map(string)} | {} |

