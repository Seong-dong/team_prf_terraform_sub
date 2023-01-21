<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.76.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_nat_gw"></a> [nat\_gw](#module\_nat\_gw) | ../modules/nat-gateway | n/a |
| <a name="module_route_add"></a> [route\_add](#module\_route\_add) | ../modules/route-add | n/a |
| <a name="module_route_add_nat"></a> [route\_add\_nat](#module\_route\_add\_nat) | ../modules/route-add | n/a |
| <a name="module_route_association"></a> [route\_association](#module\_route\_association) | ../modules/route-association | n/a |
| <a name="module_route_association_nat"></a> [route\_association\_nat](#module\_route\_association\_nat) | ../modules/route-association | n/a |
| <a name="module_route_association_tgw"></a> [route\_association\_tgw](#module\_route\_association\_tgw) | ../modules/route-association | n/a |
| <a name="module_route_private"></a> [route\_private](#module\_route\_private) | ../modules/route-table | n/a |
| <a name="module_route_private_tgw"></a> [route\_private\_tgw](#module\_route\_private\_tgw) | ../modules/route-table | n/a |
| <a name="module_route_public"></a> [route\_public](#module\_route\_public) | ../modules/route-table | n/a |
| <a name="module_subnet_private"></a> [subnet\_private](#module\_subnet\_private) | ../modules/vpc-subnet | n/a |
| <a name="module_subnet_private_tgw"></a> [subnet\_private\_tgw](#module\_subnet\_private\_tgw) | ../modules/vpc-subnet | n/a |
| <a name="module_subnet_public"></a> [subnet\_public](#module\_subnet\_public) | ../modules/vpc-subnet | n/a |
| <a name="module_vpc_hq"></a> [vpc\_hq](#module\_vpc\_hq) | ../modules/vpc | n/a |
| <a name="module_vpc_igw"></a> [vpc\_igw](#module\_vpc\_igw) | ../modules/igw | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_prod_name"></a> [prod\_name](#input\_prod\_name) | value | `string` | `"22shop"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aws_id"></a> [aws\_id](#output\_aws\_id) | The AWS Account ID. |
| <a name="output_nat_gw_id"></a> [nat\_gw\_id](#output\_nat\_gw\_id) | vpc\_id |
| <a name="output_private_subnet"></a> [private\_subnet](#output\_private\_subnet) | The name of vpc hq id |
| <a name="output_private_subnet_tgw"></a> [private\_subnet\_tgw](#output\_private\_subnet\_tgw) | The name of vpc hq id |
| <a name="output_public_subnet"></a> [public\_subnet](#output\_public\_subnet) | The name of vpc hq id |
| <a name="output_route_private_id"></a> [route\_private\_id](#output\_route\_private\_id) | get private route id |
| <a name="output_route_private_tgw_id"></a> [route\_private\_tgw\_id](#output\_route\_private\_tgw\_id) | get private route id |
| <a name="output_route_public_id"></a> [route\_public\_id](#output\_route\_public\_id) | get private route id |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | vpc\_id |
<!-- END_TF_DOCS -->