terraform {
  backend "s3" {
    bucket = "replace-with-tf-state-bucket"
    key    = "multi-stack-template/dev/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "replace-with-tf-lock-table"
    encrypt = true
  }
}
