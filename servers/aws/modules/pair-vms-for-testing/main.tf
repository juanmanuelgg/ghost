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
  template = contains(local.dont_need_second_machine, substr(var.name, 0, 1)) ? file(var.cloud_init_desired_test) : file(var.cloud_init_abp_ghost)
}

data "template_file" "user_data_for_testing" {
  template = file(var.cloud_init_desired_test)
}

resource "aws_instance" "abp_ghost" {
  count                       = var.con_parejas ? 1 : 0
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

locals {
  region_t3_micro          = ["eu-north-1"]
  dont_need_second_machine = ["☕", "🛡️"]
}

resource "aws_instance" "testing_suite" {
  count                       = contains(local.dont_need_second_machine, substr(var.name, 0, 1)) ? 0 : 1
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = contains(local.region_t3_micro, var.region) ? "t3.micro" : "t2.micro"
  subnet_id                   = var.subnet_public_id
  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = true
  user_data                   = data.template_file.user_data_for_testing.rendered

  tags = {
    env  = "lab"
    Name = "${var.name}-testing"
  }
}
