provider "aws" {
  region  = "ap-south-1" # Don't change the region
}

terraform {
  backend "s3" {
    bucket = "3.devops.candidate.exam"
    key    = "yogeshbhagwat"
    region = "ap-south-1"
  }
}
