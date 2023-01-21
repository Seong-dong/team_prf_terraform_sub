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
| [aws_route53_record.alias](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_prefix"></a> [prefix](#input\_prefix) | set host-zone id | `string` | n/a | yes |
| <a name="input_record_list"></a> [record\_list](#input\_record\_list) | set host-zone id | `list(string)` | n/a | yes |
| <a name="input_ttl"></a> [ttl](#input\_ttl) | set host-zone id | `string` | n/a | yes |
| <a name="input_type"></a> [type](#input\_type) | set host-zone id | `string` | n/a | yes |
| <a name="input_zone_id"></a> [zone\_id](#input\_zone\_id) | set host-zone id | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->