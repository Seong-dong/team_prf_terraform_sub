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
| [aws_eip.eip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_eip_association.example](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip_association) | resource |
| [aws_instance.ec2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_network_interface.eni](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_interface) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_name"></a> [ami\_name](#input\_ami\_name) | ami name | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | n/a | `string` | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | n/a | `string` | n/a | yes |
| <a name="input_private_subnet"></a> [private\_subnet](#input\_private\_subnet) | n/a | `string` | n/a | yes |
| <a name="input_public_ip_associate"></a> [public\_ip\_associate](#input\_public\_ip\_associate) | n/a | `bool` | n/a | yes |
| <a name="input_public_subnet"></a> [public\_subnet](#input\_public\_subnet) | n/a | `string` | n/a | yes |
| <a name="input_sg_list"></a> [sg\_list](#input\_sg\_list) | sg list | `list(string)` | n/a | yes |
| <a name="input_tag_name"></a> [tag\_name](#input\_tag\_name) | n/a | `string` | n/a | yes |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | n/a | `string` | `"echo 'hello'"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ec2_id"></a> [ec2\_id](#output\_ec2\_id) | n/a |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | n/a |
| <a name="output_public_ip_associate"></a> [public\_ip\_associate](#output\_public\_ip\_associate) | n/a |
| <a name="output_sg_id"></a> [sg\_id](#output\_sg\_id) | n/a |
<!-- END_TF_DOCS -->