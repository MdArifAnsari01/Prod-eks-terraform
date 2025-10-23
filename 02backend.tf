terraform {
  backend "s3" {
    bucket         = "prod-eks-remote-backend-101111"
    key            = "prod/terraform-statefile"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "my-state-locking-terraform"
  }
}