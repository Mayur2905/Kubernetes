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
# Create an EKS cluster role
resource "aws_iam_role" "example" {
  name = "eks-node-group-example"
  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
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

# Create a IAM role for EKS-Node-Group.
resource "aws_iam_role_policy_attachment" "this-AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.example.name
}

resource "aws_iam_role_policy_attachment" "this-AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.example.name
}

resource "aws_iam_role_policy_attachment" "this-AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.example.name
}
# Create an EKS node group.
resource "aws_eks_node_group" "this_node_group" {
  cluster_name = aws_eks_cluster.this_eks.name
  node_group_name = "EKS-Node-Group"
  node_role_arn = var.aws_eks_node_group_role_arn
  subnet_ids = data.aws_subnets.this_subnet.ids

  scaling_config {
    desired_size = 1
    max_size = 1
    min_size = 1
  }
  instance_types = ["t2.medium"]
  
  depends_on = [ 
    aws_iam_role_policy_attachment.this-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.this-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.this-AmazonEC2ContainerRegistryReadOnly,
   ]
  
}

# Create a MYSQL DB instance.
resource "aws_db_instance" "this_db" {
  allocated_storage    = 10
  db_subnet_group_name = "default"
  db_name              = "studentdb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "12345678"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  publicly_accessible  = true
  
  tags = {
    Name = "studentdb"
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
