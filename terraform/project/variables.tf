# La primera esta vacia aqui pero tiene valor en terraform.tfvars (Archivo que debe meterse en el .gitignore)
# do_token            = "<TOKEN>"

variable "do_token" {}

variable "do_ssh_pub_key_file" {
  default = "../secure/id_ecdsa_administrador.pub"
}

variable "do_user_data_file" {
  default = "../cloud-init.yml"
}

variable "region" {
  default = "nyc3"
}

# Este se toma del output de foundation
variable "reserved_ip_address" {
  default = "159.89.244.187"
}
