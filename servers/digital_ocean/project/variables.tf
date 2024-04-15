# Las primeras variables estan vacias aqui pero tienen valor en terraform.tfvars (Archivo que debe meterse en el .gitignore)
# do_token            = "<TOKEN>"
# reserved_ip_address = "<IP>"

variable "do_token" {}
variable "reserved_ip_address" {} # Este se toma del output de foundation

variable "do_user_data_file" {
  default = "../../cloud-init-https.yml"
}

variable "region" {
  default = "nyc3"
}
