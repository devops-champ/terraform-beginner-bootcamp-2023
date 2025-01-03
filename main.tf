terraform { 
  cloud { 
    
    organization = "Terraform-darshan" 

    workspaces { 
      name = "terra-learn" 
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
  region = "us-east-1"

}

provider "random" {
  # Configuration options
}



resource "random_string" "bucket_name" {
  length            = 16
  upper             = false
  lower             = true
  special           = false

}

resource "aws_s3_bucket" "bucket_name" {
  bucket = random_string.bucket_name.result
  
  depends_on = [random_string.bucket_name]  
}
output "random_bucket_name" {
  value = random_string.bucket_name.result
}
