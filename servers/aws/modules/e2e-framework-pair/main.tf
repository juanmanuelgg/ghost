data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*22*-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "template_file" "user_data_abp_ghost" {
  template = file(var.cloud_init_abp_ghost)
}

data "template_file" "user_data_testing_suite" {
  template = file(var.cloud_init_testing_suite)
}

resource "aws_instance" "abp_ghost" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  subnet_id                   = var.subnet_public_id
  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = true
  user_data                   = data.template_file.user_data_abp_ghost.rendered

  tags = {
    env  = "lab"
    Name = "${var.name}-abp"
  }
}

resource "aws_instance" "testing_suite" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  subnet_id                   = var.subnet_public_id
  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = true
  user_data                   = data.template_file.user_data_testing_suite.rendered

  tags = {
    env  = "lab"
    Name = "${var.name}-testing"
  }
}
