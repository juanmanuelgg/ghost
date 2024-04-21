variable "name" {
  type        = string
  description = "Nombre que describe el par de máquinas."
}

variable "cloud_init_abp_ghost" {
  type        = string
  description = "La ruta de donde se toma la configuración de la máquina de la ABP."
}

variable "cloud_init_testing_suite" {
  type        = string
  description = "La ruta de donde se toma la configuración de la máquina de suite de la pruebas."
}

variable "cloud_init_monkey" {
  type        = string
  description = "La ruta de donde se toma la configuración de la máquina del monkey."
}

variable "cloud_init_ripper" {
  type        = string
  description = "La ruta de donde se toma la configuración de la máquina del ripper."
}
variable "subnet_public_id" {
  type        = string
  description = "El id de la subnet a la que pertenece la máquina"
}

variable "security_group_id" {
  type        = string
  description = "El id de las reglas de firewall que cuidan el trafico de la máquina."
}
