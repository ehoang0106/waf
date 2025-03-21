terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"

    }
  }

  backend "s3" {
    bucket = "terraform-state-khoa-hoang"
    key    = "terraform-state-aws-waf"
    region = "us-west-1"
  }
}

provider "aws" {
  region = "us-east-1"
}