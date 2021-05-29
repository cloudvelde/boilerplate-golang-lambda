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
