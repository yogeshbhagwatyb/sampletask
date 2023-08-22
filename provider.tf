provider "aws" {
  region  = "ap-south-1" # Don't change the region
}

terraform {
  backend "s3" {
    bucket = "3.devops.candidate.exam"
    key    = "yogesh.bhagwat"
    region = "ap-south-1"
  }
}
