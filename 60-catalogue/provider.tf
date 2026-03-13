terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.33.0"
    }
  }
  backend "s3" {
    bucket = "prashump-88s-dev"
    key    = "roboshop-dev-catalogue"
    region = "us-east-1"
    use_lockfile = true
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}