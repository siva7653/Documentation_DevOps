terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.0"
    }
  }
}

# Configure the AWS provider

provider "aws" {
  region = var.region
}

# Create an EC2 instance
resource "aws_instance" "example" {
  count         = var.instance_count
  ami           = var.instance_ami
  instance_type = var.instance_type
  user_data = file("./ec2_Userdata.sh")
  vpc_security_group_ids   = [var.security_group_name]
  key_name      = var.key_name
  tags = { 
  #  name = "${var.instance_names[count.index]}"
  }
  # other instance configurations

 }

# Create a target group
resource "aws_lb_target_group" "example" {
  name        = "rakeshTargetGroup24"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.instance_vpc_id
  # other target group configurations
}

# Attach the EC2 instance to the target group
resource "aws_lb_target_group_attachment" "example" {
  count            = var.instance_count
  target_group_arn = aws_lb_target_group.example.arn
  target_id        = aws_instance.example[count.index].id
  port             = 80
}


# Create a load balancer
#resource "aws_lb" "example" {
#  name               = var.instance_loadbalancer
#  internal           = false
#  load_balancer_type = "application"
#  subnets            = var.instance_subnets
#  #security_groups    = ["your_security_group_ids"]

#  # other load balancer configurations
#}
# Create an AWS Cloud9 environment
resource "aws_cloud9_environment_ec2" "example" {
  instance_type    = "t2.micro"  # Specify the instance type
  name             = "my-cloud9-environment"
  subnet_id        = var.instance_subnets[0]  # Ensure to choose a subnet where EC2 instances can be launched
}

# Create an Amazon EKS NodeGroup
resource "aws_eks_node_group" "example" {
  cluster_name    = var.cluster_name
  node_group_name = "my-nodegroup"

  node_group_scaling_config {
    desired_size = 2  # Specify your desired size
    max_size     = 3  # Specify your max size
    min_size     = 2  # Specify your min size
  }

  node_group_instance_type = "t2.micro"  # Specify your instance type
  ami_type                 = "AL2_x86_64"  # Specify your Amazon Linux 2 AMI type

  remote_access {
    ec2_ssh_key = var.key_name  # Specify your SSH key pair name
  }

  subnet_ids = var.instance_subnets  # Specify your subnets for EKS NodeGroup

  #depends_on = [aws_eks_cluster.example]  # Ensure the cluster is created before creating NodeGroup
}

# Create an Amazon EKS Cluster
resource "aws_iam_role" "eks_cluster_role" {
  name               = "eks-cluster-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect    = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
        Action    = "sts:AssumeRole"
      }
    ]
  })
}
resource "aws_eks_cluster" "my_cluster" {
  name     = "my-cluster"
  role_arn = "arn:aws:iam::077772766214:role/microservice_eks_cluster"
  version  = var.eks_version

  vpc_config {
    subnet_ids         = var.instance_vpc_subnets  # List of subnet IDs where EKS nodes will be launched
    security_group_ids = [var.eks_cluster_security_group_id]  # List of security group IDs for the EKS cluster
  }
}

