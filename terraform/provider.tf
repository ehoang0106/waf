terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"

    }
  }

  backend "s3" {
    bucket = "terraform-state-khoa-hoang"
    key    = "terraform-state-aws-waf"
    region = var.primary_region
  }
}

provider "aws" {
  region = var.primary_region
}
