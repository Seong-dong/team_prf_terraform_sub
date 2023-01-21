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
| [aws_efs_mount_target.mount](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_mount_target) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_fs_id"></a> [fs\_id](#input\_fs\_id) | fs\_id | `string` | n/a | yes |
| <a name="input_sg_list"></a> [sg\_list](#input\_sg\_list) | security group list | `list(string)` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | security group list | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->