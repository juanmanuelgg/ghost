variable "region" {
  type        = string
  description = "The region Terraform deploys your instance"
  nullable    = false
}

variable "name" {
  type        = string
  description = "Nombre que describe el par de máquinas."
  nullable    = false
}

variable "cloud_init_abp_ghost" {
  type        = string
  description = "La ruta de donde se toma la configuración de la máquina de la ABP."
  nullable    = false
}

variable "cloud_init_desired_test" {
  type        = string
  description = "La ruta de donde se toma la configuración de la máquina de suite de la pruebas."
  nullable    = false
}

variable "subnet_public_id" {
  type        = string
  description = "El id de la subnet a la que pertenece la máquina"
  nullable    = false
}

variable "security_group_id" {
  type        = string
  description = "El id de las reglas de firewall que cuidan el trafico de la máquina."
  nullable    = false
}

variable "con_parejas" {
  type        = bool
  default     = true
  description = "Sirve para configurar si todos los test apuntan a una sola máquina."
}
