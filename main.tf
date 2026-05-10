data "aws_ssm_parameter" "amazon_linux" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

# Define an input variable for the EC2 instance type
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

# Define an input variable for the EC2 instance AMI ID
variable "ami_id" {
  description = "EC2 AMI ID"
  type        = string
  default     = null
}

locals {
  ami_id = var.ami_id != null ? var.ami_id : data.aws_ssm_parameter.amazon_linux.value
}

provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "test" {
  instance_type = "t3.micro"
  ami           = local.ami_id

  tags = {
    Name = "my-free-tier-instance"
  }
}

output "public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.test.public_ip
}
