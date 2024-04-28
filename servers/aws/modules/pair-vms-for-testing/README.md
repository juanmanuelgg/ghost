## Requirements

No requirements.

## Providers

| Name                                                            | Version |
| --------------------------------------------------------------- | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws)                | n/a     |
| <a name="provider_template"></a> [template](#provider_template) | n/a     |

## Modules

No modules.

## Resources

| Name                                                                                                                            | Type        |
| ------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [aws_instance.abp_ghost](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)                  | resource    |
| [aws_instance.testing_suite](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)              | resource    |
| [aws_ami.ubuntu](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami)                            | data source |
| [template_file.user_data_abp_ghost](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file)   | data source |
| [template_file.user_data_for_testing](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name                                                                                                   | Description                                                                     | Type     | Default | Required |
| ------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------- | -------- | ------- | :------: |
| <a name="input_cloud_init_abp_ghost"></a> [cloud_init_abp_ghost](#input_cloud_init_abp_ghost)          | La ruta de donde se toma la configuración de la máquina de la ABP.              | `string` | n/a     |   yes    |
| <a name="input_cloud_init_desired_test"></a> [cloud_init_desired_test](#input_cloud_init_desired_test) | La ruta de donde se toma la configuración de la máquina de suite de la pruebas. | `string` | n/a     |   yes    |
| <a name="input_name"></a> [name](#input_name)                                                          | Nombre que describe el par de máquinas.                                         | `string` | n/a     |   yes    |
| <a name="input_region"></a> [region](#input_region)                                                    | The region Terraform deploys your instance                                      | `string` | n/a     |   yes    |
| <a name="input_security_group_id"></a> [security_group_id](#input_security_group_id)                   | El id de las reglas de firewall que cuidan el trafico de la máquina.            | `string` | n/a     |   yes    |
| <a name="input_subnet_public_id"></a> [subnet_public_id](#input_subnet_public_id)                      | El id de la subnet a la que pertenece la máquina                                | `string` | n/a     |   yes    |

## Outputs

| Name                                                                                                              | Description |
| ----------------------------------------------------------------------------------------------------------------- | ----------- |
| <a name="output_abp_instance_public_ip"></a> [abp_instance_public_ip](#output_abp_instance_public_ip)             | n/a         |
| <a name="output_testing_instance_public_ip"></a> [testing_instance_public_ip](#output_testing_instance_public_ip) | n/a         |
