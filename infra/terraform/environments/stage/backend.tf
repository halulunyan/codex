terraform {
  backend "s3" {
    bucket         = "replace-with-tf-state-bucket"
    key            = "multi-stack-template/stage/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "replace-with-tf-lock-table"
    encrypt        = true
  }
}
