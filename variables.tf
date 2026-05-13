# Define an input variable for the EC2 instance type
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

# Define an input variable for the EC2 instance AMI ID
variable "ami_id" {
  description = "EC2 AMI ID"
  type        = string
}

variable "ec2_tag_name" {
  description = "EC2 Name tag"
  type        = string
}

variable "aws_region" {
  description = "AWS Region"
  type        = string
}
