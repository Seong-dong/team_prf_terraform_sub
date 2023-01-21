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
| [aws_cloud9_environment_membership.cloud9-env](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloud9_environment_membership) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud9_id"></a> [cloud9\_id](#input\_cloud9\_id) | cloud9-ec2 | `string` | n/a | yes |
| <a name="input_permissions"></a> [permissions](#input\_permissions) | n/a | `string` | n/a | yes |
| <a name="input_user_arn"></a> [user\_arn](#input\_user\_arn) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->