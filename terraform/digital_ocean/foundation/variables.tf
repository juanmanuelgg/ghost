# La primera esta vacia aqui pero tienen valor en terraform.tfvars (Archivo que debe meterse en el .gitignore)
# do_token            = "<TOKEN>"

variable "do_token" {}

variable "do_ssh_pub_key_file" {
  default = "../../secure/id_ecdsa_administrador.pub"
}

variable "region" {
  default = "nyc3"
}

