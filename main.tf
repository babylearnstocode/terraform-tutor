data "aws_ssm_parameter" "amazon_linux" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

locals {
  ami_id = var.ami_id != null ? var.ami_id : data.aws_ssm_parameter.amazon_linux.value
}

module "ec2_instance" {
  source        = "git::https://github.com/babylearnstocode/terraform-tutor-modules.git//ec2?ref=v0.0.2"
  instance_type = var.instance_type
  ami_id        = local.ami_id
  ec2_tag_name  = var.ec2_tag_name

}
