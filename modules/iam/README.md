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
| [aws_iam_role.iam-role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_iam_name"></a> [iam\_name](#input\_iam\_name) | value | `string` | n/a | yes |
| <a name="input_policy"></a> [policy](#input\_policy) | value | `string` | n/a | yes |
| <a name="input_tag_name"></a> [tag\_name](#input\_tag\_name) | value | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_arn"></a> [iam\_arn](#output\_iam\_arn) | n/a |
| <a name="output_iam_name"></a> [iam\_name](#output\_iam\_name) | n/a |
<!-- END_TF_DOCS -->