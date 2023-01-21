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
| [aws_subnet.subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_public_ip_on"></a> [public\_ip\_on](#input\_public\_ip\_on) | n/a | `bool` | n/a | yes |
| <a name="input_subnet-az-list"></a> [subnet-az-list](#input\_subnet-az-list) | Subnet available zone & cidr | `map(map(string))` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | set vpc id | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnet"></a> [subnet](#output\_subnet) | The name of vpc hq id |
<!-- END_TF_DOCS -->