package main

import (
	"context"
	"github.com/aws/aws-lambda-go/lambda"
)

func Handler(ctx context.Context) (string, error) {
	return "this should work!", nil
}

func main() {
	lambda.Start(Handler)
}