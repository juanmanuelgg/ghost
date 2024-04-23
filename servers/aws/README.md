## Requirements

| Name                                                   | Version |
| ------------------------------------------------------ | ------- |
| <a name="requirement_aws"></a> [aws](#requirement_aws) | ~> 5.0  |

## Providers

No providers.

## Modules

| Name                                                                                      | Source                       | Version |
| ----------------------------------------------------------------------------------------- | ---------------------------- | ------- |
| <a name="module_e2e_framework_pair"></a> [e2e_framework_pair](#module_e2e_framework_pair) | ./modules/e2e-framework-pair | n/a     |
| <a name="module_foundation"></a> [foundation](#module_foundation)                         | ./modules/foundation         | n/a     |

## Resources

No resources.

## Inputs

| Name                                                                                                      | Description                                | Type     | Default                                  | Required |
| --------------------------------------------------------------------------------------------------------- | ------------------------------------------ | -------- | ---------------------------------------- | :------: |
| <a name="input_access_key"></a> [access_key](#input_access_key)                                           | n/a                                        | `any`    | n/a                                      |   yes    |
| <a name="input_cidr_subnet"></a> [cidr_subnet](#input_cidr_subnet)                                        | CIDR block for the subnet                  | `string` | `"10.1.0.0/24"`                          |    no    |
| <a name="input_cidr_vpc"></a> [cidr_vpc](#input_cidr_vpc)                                                 | CIDR block for the VPC                     | `string` | `"10.1.0.0/16"`                          |    no    |
| <a name="input_cloud_init_abp_ghost"></a> [cloud_init_abp_ghost](#input_cloud_init_abp_ghost)             | n/a                                        | `string` | `"../cloud-init-abp-ghost.yml"`          |    no    |
| <a name="input_cloud_init_monkey"></a> [cloud_init_monkey](#input_cloud_init_monkey)                      | n/a                                        | `string` | `"../cloud-init-monkey.yml"`             |    no    |
| <a name="input_cloud_init_ripper"></a> [cloud_init_ripper](#input_cloud_init_ripper)                      | n/a                                        | `string` | `"../cloud-init-ripper.yml"`             |    no    |
| <a name="input_cloud_init_testing_suite"></a> [cloud_init_testing_suite](#input_cloud_init_testing_suite) | n/a                                        | `string` | `"../cloud-init-testing-suite.yml"`      |    no    |
| <a name="input_ec2_ssh_pub_key_file"></a> [ec2_ssh_pub_key_file](#input_ec2_ssh_pub_key_file)             | n/a                                        | `string` | `"../secure/id_ecdsa_administrador.pub"` |    no    |
| <a name="input_environment_tag"></a> [environment_tag](#input_environment_tag)                            | Environment tag                            | `string` | `"Learn"`                                |    no    |
| <a name="input_region"></a> [region](#input_region)                                                       | The region Terraform deploys your instance | `string` | `"us-east-1"`                            |    no    |
| <a name="input_secret_key"></a> [secret_key](#input_secret_key)                                           | n/a                                        | `any`    | n/a                                      |   yes    |

## Outputs

| Name                                                                                                                 | Description |
| -------------------------------------------------------------------------------------------------------------------- | ----------- |
| <a name="output_abp_instance_public_ips"></a> [abp_instance_public_ips](#output_abp_instance_public_ips)             | n/a         |
| <a name="output_testing_instance_public_ips"></a> [testing_instance_public_ips](#output_testing_instance_public_ips) | n/a         |
