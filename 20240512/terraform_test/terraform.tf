terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 4.16"
        }
    }

    required_version = ">= 1.2.0"

    backend "s3" {
        bucket = "terraform-state-danit-devops-2"
        key = "volodymyr/backend-s3"
        region = "eu-central-1"
    }
}

provider "aws" {
    region = "eu-central-1"
}