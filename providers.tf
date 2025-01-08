# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"  # Set the region for AWS resources
 
}

# terraform {
#   backend "s3" {
#     bucket = "s3-bucket-batch28-yugesh"  # Hardcode the bucket name here
#     key    = "terraform.tfstate"
#     region = "us-east-1"
#     encrypt = true
#   }
# }

terraform {
  backend "s3" {
    bucket = "kafkainfraststefile"    # Replace with your bucket name
    key    = "terraform.tfstate"    # Path inside the bucket where the state file will be stored
    region = "ap-south-1"                      # Replace with your AWS region
    encrypt = true                            # Enable encryption of the state file in S3 (recommended)
  
  }
}


