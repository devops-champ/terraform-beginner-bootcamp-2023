terraform {

  cloud {
    organization = "Terraform-darshan"
    workspaces {
      name = "terrahouse"    
    } 
  }

  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.6.3"
    }

    aws = {
      source = "hashicorp/aws"
      version = "5.82.2"
    }    
  }
}

provider "aws" {
  # Configuration options
}
provider "random" {
  # Configuration options
}



resource "random_string" "bucket_name" {
  length           = 32
  upper = false
  lower = true
  special          = false

}

resource "aws_s3_bucket" "bucket_name" {
  bucket = random_string.bucket_name.result
  
}
output "random_bucket_name" {
  value = random_string.bucket_name.result
}
