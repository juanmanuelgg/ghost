# Las llaves estan vacia aqui pero tienen valor en terraform.tfvars (Archivo que debe meterse en el .gitignore)
# access_key            = "<my-access-key>"
# secret_key            = "<my-secret-key>"

variable "access_key" {}

variable "secret_key" {}

variable "region" {
  description = "The region Terraform deploys your instance"
  default     = "us-east-1"
}

variable "ec2_ssh_pub_key_file" {
  default = "../secure/id_ecdsa_administrador.pub"
}

variable "cloud_init_abp_ghost" {
  default = "../cloud-init-abp-ghost.yml"
}

variable "cloud_init_testing_suite" {
  default = "../cloud-init-testing-suite.yml"
}

variable "cloud_init_monkey" {
  default = "../cloud-init-monkey.yml"
}

variable "cloud_init_ripper" {
  default = "../cloud-init-ripper.yml"
}

variable "cidr_vpc" {
  description = "CIDR block for the VPC"
  default     = "10.1.0.0/16"
}

variable "cidr_subnet" {
  description = "CIDR block for the subnet"
  default     = "10.1.0.0/24"
}

variable "environment_tag" {
  description = "Environment tag"
  default     = "Learn"
}
