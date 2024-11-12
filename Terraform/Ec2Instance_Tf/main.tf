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
    name = "${var.instance_names[count.index]}"
  }
  # other instance configurations

 }

# Create a target group
resource "aws_lb_target_group" "example" {
  name        = "rakeshTargetGroup24"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.instance_vpc
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
resource "aws_lb" "example" {
  name               = var.instance_loadbalancer
  internal           = false
  load_balancer_type = "application"
  subnets            = var.instance_subnets
  #security_groups    = ["your_security_group_ids"]

  # other load balancer configurations
}
