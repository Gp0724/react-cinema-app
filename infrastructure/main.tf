provider "aws" {
  region = "eu-central-1"
}

terraform {
  backend "s3" {
    bucket  = "app-cinema-tf-state-01"
    key     = "app-cinema.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}

locals {
  prefix = "${var.prefix}-${terraform.workspace}"
  common_tags = {
    Environment = terraform.workspace
    Project     = var.project
    ManageBy    = "Terraform"
    Owner       = "Gautam"
  }
}

