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
| [aws_security_group_rule.sg-rule-add](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_blocks"></a> [cidr\_blocks](#input\_cidr\_blocks) | cidr\_blocks | `list(string)` | n/a | yes |
| <a name="input_from_port"></a> [from\_port](#input\_from\_port) | from port | `number` | n/a | yes |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | protocol | `string` | n/a | yes |
| <a name="input_security_group_id"></a> [security\_group\_id](#input\_security\_group\_id) | n/a | `any` | n/a | yes |
| <a name="input_tag_name"></a> [tag\_name](#input\_tag\_name) | tag\_name | `string` | n/a | yes |
| <a name="input_to_port"></a> [to\_port](#input\_to\_port) | to\_port | `number` | n/a | yes |
| <a name="input_type"></a> [type](#input\_type) | security rule type | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->