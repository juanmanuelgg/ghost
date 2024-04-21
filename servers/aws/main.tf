# Construido sobre: https://github.com/hashicorp/learn-terraform-provisioning/blob/cloudinit/instances/main.tf

# (1)aws_vpc, (1)aws_internet_gateway, (1)aws_subnet, (1)aws_route_table, (1)aws_route_table_association, (1)aws_security_group
module "foundation" {
  source      = "./modules/foundation"
  cidr_vpc    = var.cidr_vpc
  cidr_subnet = var.cidr_subnet
}

# (1)aws_ami, (2)template_file, (2)aws_instance
module "e2e_framework_pair" {
  for_each                 = toset(["🔬-1", "🐒-1", "🐒-2", "🎩-1"])
  source                   = "./modules/e2e-framework-pair"
  name                     = each.key
  subnet_public_id         = module.foundation.subnet_public_id
  security_group_id        = module.foundation.security_group_id
  cloud_init_abp_ghost     = var.cloud_init_abp_ghost
  cloud_init_testing_suite = var.cloud_init_testing_suite # 🔬 Automatizadas soportadas con Apis
  cloud_init_monkey        = var.cloud_init_monkey        # 🐒 Automatizadas soportadas con Explorador aleatorio
  cloud_init_ripper        = var.cloud_init_ripper        # 🎩 Automatizadas soportadas con Explorador sistematico
  # TODO: Evaluar una prueba de tipo carga (🦗)
}
