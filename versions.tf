terraform {
  required_version = ">= 1.11.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.97"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.7"
    }
  }
}
