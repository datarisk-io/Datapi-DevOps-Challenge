provider "aws" {
    region  = var.aws_region

  default_tags {
    tags = {
      Project   = "Terraform GHA setup"
      CreatedAt = "2021-06-05"
      ManagedBy = "Terraform"
      Owner     = "Web enterprise"
    }
  }
}


terraform {
#   required_version = "1.5.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.44.0"
    }
  }
}
