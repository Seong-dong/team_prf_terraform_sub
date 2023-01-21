<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route.route-igw-add](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.route-nat-add](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gw_type"></a> [gw\_type](#input\_gw\_type) | gateway type. nat or igw | `string` | n/a | yes |
| <a name="input_igw_id"></a> [igw\_id](#input\_igw\_id) | value | `string` | `"null"` | no |
| <a name="input_nat_id"></a> [nat\_id](#input\_nat\_id) | value | `string` | `"null"` | no |
| <a name="input_route_id"></a> [route\_id](#input\_route\_id) | value | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->