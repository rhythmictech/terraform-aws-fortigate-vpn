
terraform {
  required_version = ">= 0.12"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 2"
    }
    local = {
      source  = "hashicorp/local"
      version = ">= 1"
    }
  }
}
