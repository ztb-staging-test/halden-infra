terraform {
  required_version = ">= 1.6"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.60"
    }
  }

  backend "s3" {
    bucket         = "halden-terraform-state"
    key            = "prod/core.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "halden-terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = var.region

  default_tags {
    tags = {
      Project     = "halden"
      Environment = var.environment
      ManagedBy   = "terraform"
    }
  }
}
