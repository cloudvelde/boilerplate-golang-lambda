# boilerplate-golang-lambda
Just a boilerplate AWS Lambda function in golang!


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