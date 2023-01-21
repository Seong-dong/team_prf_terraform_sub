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
| [aws_iam_policy_attachment.test-attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_arn"></a> [arn](#input\_arn) | value | `string` | n/a | yes |
| <a name="input_iam_name"></a> [iam\_name](#input\_iam\_name) | value | `string` | n/a | yes |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | value | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->