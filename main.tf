terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.6.3"
    }

    aws = {
      source = "hashicorp/aws"
      version = "5.16.2"
    }    
  }
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
