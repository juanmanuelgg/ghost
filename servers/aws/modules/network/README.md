## Requirements

No requirements.

## Providers

| Name                                             | Version |
| ------------------------------------------------ | ------- |
| <a name="provider_aws"></a> [aws](#provider_aws) | n/a     |

## Modules

No modules.

## Resources

| Name                                                                                                                                                 | Type     |
| ---------------------------------------------------------------------------------------------------------------------------------------------------- | -------- |
| [aws_internet_gateway.igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway)                             | resource |
| [aws_route_table.rtb_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table)                                | resource |
| [aws_route_table_association.rta_subnet_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_security_group.security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)                      | resource |
| [aws_subnet.subnet_public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet)                                       | resource |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc)                                                       | resource |

## Inputs

| Name                                                               | Description | Type     | Default | Required |
| ------------------------------------------------------------------ | ----------- | -------- | ------- | :------: |
| <a name="input_cidr_subnet"></a> [cidr_subnet](#input_cidr_subnet) | n/a         | `string` | n/a     |   yes    |
| <a name="input_cidr_vpc"></a> [cidr_vpc](#input_cidr_vpc)          | n/a         | `string` | n/a     |   yes    |

## Outputs

| Name                                                                                   | Description |
| -------------------------------------------------------------------------------------- | ----------- |
| <a name="output_security_group_id"></a> [security_group_id](#output_security_group_id) | n/a         |
| <a name="output_subnet_public_id"></a> [subnet_public_id](#output_subnet_public_id)    | n/a         |
