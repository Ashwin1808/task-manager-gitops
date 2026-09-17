terraform {
  required_version = ">= 1.14.0"

  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region                      = var.aws_region
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true

  endpoints {
    s3 = "http://localhost:4566"
  }
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "ashwin-task-manager-terraform-state-demo"

  tags = {
    Name        = "Task Manager Terraform State"
    Environment = "dev"
    Project     = "task-manager"
  }
}