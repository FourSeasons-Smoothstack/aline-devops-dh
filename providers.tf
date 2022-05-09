#Provider Info

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.11.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  shared_config_files      = ["$HOME/.aws/conf"]
  shared_credentials_files = ["$HOME/.aws/creds"]
}