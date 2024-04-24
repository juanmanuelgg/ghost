# Las llaves estan vacia aqui pero tienen valor en terraform.tfvars (Archivo que debe meterse en el .gitignore)
# access_key            = "<my-access-key>"
# secret_key            = "<my-secret-key>"

variable "access_key" {}

variable "secret_key" {}

variable "region" {
  type        = string
  description = "The region Terraform deploys your instance"
  default     = "eu-north-1"
  nullable    = false
}

variable "ec2_ssh_pub_key_file" {
  type        = string
  description = "La llave publica de un par de llaves usadas para ingresar a las máquinas."
  default     = "../secure/id_ecdsa_administrador.pub"
  nullable    = false
}

variable "cloud_init_abp_ghost" {
  type        = string
  description = ""
  default     = "../cloud-init-abp-ghost.yml"
  nullable    = false
}

variable "cidr_vpc" {
  type        = string
  description = "CIDR block for the VPC"
  default     = "10.1.0.0/16"
  nullable    = false
}

variable "cidr_subnet" {
  type        = string
  description = "CIDR block for the subnet"
  default     = "10.1.0.0/24"
  nullable    = false
}
