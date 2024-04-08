# This file contains the code to create an EKS cluster and a node group.
data "aws_vpc" "this_vpc" {
    default = true
}
data "aws_subnets" "this_subnet"{
    filter {
      name = "vpc-id"
    values = [data.aws_vpc.this_vpc.id]
    }
}
# Create an EKS cluster. 
resource "aws_eks_cluster" "this_eks" {
    name = "EKS-Cluster"
    role_arn = var.aws_eks_role_arn
    vpc_config {
      subnet_ids = data.aws_subnets.this_subnet.ids
    }

    depends_on = [aws_db_instance.this_db]

    tags = {
      Name = "EKS-Cluster"
    }
}
# Create an EKS node group.
resource "aws_eks_node_group" "this_node_group" {
    cluster_name = aws_eks_cluster.this_eks.name
    node_group_name = "EKS-Node-Group"
    node_role_arn = var.aws_eks_node_group_role_arn
    subnet_ids = data.aws_subnets.this_subnet.ids

    scaling_config {
        desired_size = 1
        max_size =  1
        min_size = 1
    }

    instance_types = ["t2.medium"]
    depends_on = [aws_eks_cluster.this_eks]
}

# Create a MYSQL DB instance.
resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "studentapp"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "12345678"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  tag = {
        Name = studentapp
    }
}

# Create a S3 bucket.
resource "aws_s3_bucket" "this-bucket" {
    bucket = "student-artifact"
    tags = {
      Name = "student-artifact"
    }
  
}


# making versioning enabled for the bucket
resource "aws_s3_bucket_versioning" "this_bucket_versioning" {
    bucket = aws_s3_bucket.this-bucket.bucket
     versioning_configuration {
    status = "Enabled"
  }

}
