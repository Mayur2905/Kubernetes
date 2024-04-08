# backend of s3 bucket
terraform {
    backend "s3" {
        bucket = "terraform-eks-2024"
        key    = "terraform.tfstate"
        region = "us-east-2"
    }
}