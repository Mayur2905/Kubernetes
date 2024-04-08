# backend of s3 bucket
terraform {
    backend "s3" {
        bucket = "mariobymg"
        key    = "terraform.tfstate"
        region = "us-east-2"
    }
}
