data "aws_ssm_parameter" "amazon_linux" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

locals {
  ami_id = var.ami_id != null ? var.ami_id : data.aws_ssm_parameter.amazon_linux.value
}

resource "aws_instance" "test" {
  instance_type = "t3.micro"
  ami           = local.ami_id

  tags = {
    Name = var.ec2_tag_name
  }
}
