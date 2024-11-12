variable "region" {
  description = "AWS region where resources will be provisioned"
  type        = string
  default     = "us-east-1"  # Update with your desired default region
}

variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
  default     = 2  # Update with your desired default count
}

variable "instance_ami" {
  description = "The ID of the AMI to use for instances"
  type        = string
  default     = "ami-08a0d1e16fc3f61ea"  # Replace with the default AMI ID
  # Update with your desired AMI ID
}

variable "instance_type" {
  description = "Instance type for EC2 instances"
  type        = string
  default     = "t2.micro"  # Update with your desired instance type
}

#variable "instance_names" {
  #description = "The name for the EC2 instance"
  #type        = list(string)
  #default     = "rakeshec2" # Provide a default name if needed
  # Update with the list of names corresponding to instance_count
#}

variable "security_group_name" {
  description = "Name of the existing security group to associate with EC2 instances"
  type        = string
  default     = "sg-099d03b13a8a18077"
  # Update with the desired security group name
}

variable "key_name" {
  description = "Name of the PEM key"
  type        = string
  default     = "us-east-1.pem"
  # Update with your SSH key pair name
}

variable "instance_loadbalancer" {
  description = "name of the instance loadbalancer"
  type        = string
  default     = "rakesh-load"
  # Update with your desired load balancer name
}

variable "instance_subnets" {
  description = "A list of subnet IDs where the instances will be launched"
  type        = list(string)
  default     = ["subnet-0fb85e28f003e1f9f", "subnet-0a7b15fb58c4f89c8"]
  # Update with your list of subnet IDs
}

variable "eks_cluster_security_group_id" {
  description = "eks cluster security id"
  type        = string
  default     = "sg-099d03b13a8a18077"
  
  # Update with your desired security group ID for EKS cluster
}
variable "eks_version" {
  description = "The version of Amazon EKS cluster"
  default     = "1.28"  # Update with your desired EKS version
}


variable "instance_vpc_subnets" {
  description = "List of subnet IDs where EKS nodes will be launched"
  type        = list(string)
  default     = ["subnet-0fb85e28f003e1f9f", "subnet-0a7b15fb58c4f89c8"]  # Example subnet IDs
}

variable "instance_vpc_id" {
  description = "The VPC ID where resources will be created."
  type        = string
  default     = "vpc-064c339629a7b0e8d" # Replace with your actual default VPC ID
}

variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
  default     = "test-siva"
}

