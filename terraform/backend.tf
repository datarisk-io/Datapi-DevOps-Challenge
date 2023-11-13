terraform {
  backend "s3" {
    bucket  = "richardneves-tfstate"
    key     = "dev/tfstate-challenge"
    region  = "us-east-1"
    encrypt = true
  }
}