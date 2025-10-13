terraform {
  backend "s3" {
    bucket         = "replace-with-tf-state-bucket"
    key            = "multi-stack-template/prod/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "replace-with-tf-lock-table"
    encrypt        = true
  }
}
