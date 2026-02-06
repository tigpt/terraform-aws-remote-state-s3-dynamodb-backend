# deprecated - replaced by [terraform-aws-remote-backend-s3](https://github.com/tigpt/terraform-aws-remote-backend-s3?tab=readme-ov-file)




# terraform-aws-remote-state-s3-dynamodb-backend

[![Releases](https://img.shields.io/github/v/release/tigpt/terraform-aws-remote-state-s3-dynamodb-backend)](https://github.com/tigpt/terraform-aws-remote-state-s3-dynamodb-backend/releases/latest)

[Terraform Module Registry](https://registry.terraform.io/modules/tigpt/remote-state-s3-dynamodb-backend/aws)

A terraform module to set up [remote state management](https://www.terraform.io/docs/state/remote.html) with [S3 backend](https://www.terraform.io/docs/backends/types/s3.html) for your account. It creates an encrypted S3 bucket to store state files and a DynamoDB table for state locking and consistency checking.
Resources are defined following best practices as described in [the official document](https://www.terraform.io/docs/backends/types/s3.html#multi-account-aws-architecture) and [ozbillwang/terraform-best-practices](https://github.com/ozbillwang/terraform-best-practices).
It heritages a from our loved ❤️ [Terraform AWS modules](https://registry.terraform.io/namespaces/terraform-aws-modules) and leverage S3 and DynamoDB from this repos.

## Features

- Create a S3 bucket to store remote state files.
- Encrypt state files with KMS.
- Enable object versioning to prevent accidental data loss.
- Create a DynamoDB table for state locking, encryption is optional.

## Usage

```hcl
module "remote-state-s3-dynamodb-backend" {
  source  = "tigpt/remote-state-s3-dynamodb-backend/aws"
  version = "1.0.2"

  name = "my-terraform-backend"

  tags = {
    terraform = "true"
  }
}
```

## Compatibility

- Starting from v1.0, this module requires [Terraform Provider for AWS](https://github.com/terraform-providers/terraform-provider-aws) v4.0 or later. [Version 1.0 Upgrade Guide](./docs/upgrade-1.0.md) described the recommended procedure after the upgrade.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.7.2 |
| aws | >= 5.34 |
| random | >= 3.6 |

## Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| <a name="iname"></a> [name](#name) | Base name for your state storing resources (typicaly equal to account name) | `string` | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A mapping of tags to assign to resources. | `map(string)` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="tf_state_dynamodb_name"></a> [tf\_state\_dynamodb\_name](#tf\_state\_dynamodb\_name) | The name of DynamoDB table to manage lock states. |
| <a name="tf_state_dynamodb_arn"></a> [tf\_state\_dynamodb\_arn](#tf\_state\_dynamodb\_arn) | The arn of DynamoDB table to manage lock states. |
| <a name="tf_state_s3_bucket_name"></a> [tf\_state\_s3\_bucket\_arn](#tf\_state\_s3\_bucket\_arnt) | The name of S3 bucket to store the remote state file. |
| <a name="tf_state_s3_bucket_arn"></a> [tf\_state\_s3\_bucket\_arn](#tf\_state\_s3\_bucket\_arn) | The arn of S3 bucket to store the remote state file. |
