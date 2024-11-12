variable "region" {
  type    = string
  default = "us-east-1"
}

variable "ports" {
  type    = list(number)
  default = [22,80,8080]
}


variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "instance_count" {
  description = "Number of EC2 instances to create"
  type        = number
  default     = 5
}

variable "instance_ami" {
  description = "The ID of the AMI to use for instances."
  type        = string
  default     = "ami-04b70fa74e45c3917"  # Replace with the default AMI ID
}

variable "instance_loadbalancer" {
  description = "Name of the load balancer."
  type        = string
  default     = "rakesh-load-balancer25"  # Replace with the default load balancer name
}

variable "instance_subnets" {
  description = "A list of subnet IDs where the instances will be launched."
  type        = list(string)
  default     = ["subnet-06a0599646bbda43b", "subnet-03f513ae0e9d88737"]
}


variable "instance_vpc" {
  description = "The ID of the VPC where the instances will be launched."
  type        = string
  default     = "vpc-0959a807a18fe23d8"  # Replace with your default VPC ID
}
variable "instance_name" {
  description = "The name for the EC2 instance."
  type        = string
  default     = "rockstar" # Provide a default name if needed
}

variable "security_group_name" {
  description = "Name of the existing security group to associate with EC2 instances"
  type        = string
  default     = "rakesh_sercurityGroup"
}

variable "instance_names" {
  description = "Names for the EC2 instances"
  type        = list(string)
  default     = ["Slave01", "Slave02", "Slave03", "Slave04", "Slave05"]  # Default names, adjust as needed
}

variable "key_name" {
  description = "Name of the PEM key"
  type        = string
  default     = "siva_test"
  }
