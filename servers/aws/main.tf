# Construido sobre: https://github.com/hashicorp/learn-terraform-provisioning/blob/cloudinit/instances/main.tf

module "foundation" {
  source      = "./modules/foundation"
  cidr_vpc    = var.cidr_vpc
  cidr_subnet = var.cidr_subnet
}

module "e2e_framework_pair" {
  for_each                 = toset(["1-🙈", "2-🙉", "3-🙊"])
  source                   = "./modules/e2e-framework-pair"
  name                     = each.key
  subnet_public_id         = module.foundation.subnet_public_id
  security_group_id        = module.foundation.security_group_id
  cloud_init_abp_ghost     = var.cloud_init_abp_ghost
  cloud_init_testing_suite = var.cloud_init_testing_suite
}
