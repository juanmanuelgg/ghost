## Requirements

| Name                                                   | Version |
| ------------------------------------------------------ | ------- |
| <a name="requirement_aws"></a> [aws](#requirement_aws) | ~> 5.0  |

## Providers

No providers.

## Modules

| Name                                                                                            | Source                         | Version |
| ----------------------------------------------------------------------------------------------- | ------------------------------ | ------- |
| <a name="module_network"></a> [network](#module_network)                                        | ./modules/network              | n/a     |
| <a name="module_pair_vms_for_testing"></a> [pair_vms_for_testing](#module_pair_vms_for_testing) | ./modules/pair-vms-for-testing | n/a     |

## Resources

No resources.

## Inputs

| Name                                                                                          | Description                                                               | Type     | Default                                  | Required |
| --------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------- | -------- | ---------------------------------------- | :------: |
| <a name="input_access_key"></a> [access_key](#input_access_key)                               | n/a                                                                       | `any`    | n/a                                      |   yes    |
| <a name="input_cidr_subnet"></a> [cidr_subnet](#input_cidr_subnet)                            | CIDR block for the subnet                                                 | `string` | `"10.1.0.0/24"`                          |    no    |
| <a name="input_cidr_vpc"></a> [cidr_vpc](#input_cidr_vpc)                                     | CIDR block for the VPC                                                    | `string` | `"10.1.0.0/16"`                          |    no    |
| <a name="input_cloud_init_abp_ghost"></a> [cloud_init_abp_ghost](#input_cloud_init_abp_ghost) | n/a                                                                       | `string` | `"../cloud-init-abp-ghost.yml"`          |    no    |
| <a name="input_ec2_ssh_pub_key_file"></a> [ec2_ssh_pub_key_file](#input_ec2_ssh_pub_key_file) | La llave publica de un par de llaves usadas para ingresar a las máquinas. | `string` | `"../secure/id_ecdsa_administrador.pub"` |    no    |
| <a name="input_region"></a> [region](#input_region)                                           | The region Terraform deploys your instance                                | `string` | `"eu-north-1"`                           |    no    |
| <a name="input_secret_key"></a> [secret_key](#input_secret_key)                               | n/a                                                                       | `any`    | n/a                                      |   yes    |

## Outputs

| Name                                                                                                                 | Description |
| -------------------------------------------------------------------------------------------------------------------- | ----------- |
| <a name="output_abp_instance_public_ips"></a> [abp_instance_public_ips](#output_abp_instance_public_ips)             | n/a         |
| <a name="output_testing_instance_public_ips"></a> [testing_instance_public_ips](#output_testing_instance_public_ips) | n/a         |
