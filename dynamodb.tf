#############################
#--- DynamoDB State Lock ---#
#############################

module "dynamodb_table" {
  source  = "terraform-aws-modules/dynamodb-table/aws"
  version = "4.0.0"

  name     = "tf-${var.name}-${random_integer.random.id}-locktable"
  hash_key = "LockID"

  attributes = [
    {
      name = "LockID"
      type = "S"
    }
  ]

  deletion_protection_enabled    = true
  point_in_time_recovery_enabled = true

  server_side_encryption_enabled     = var.kms_encription
  server_side_encryption_kms_key_arn = var.kms_encription ? aws_kms_key.dynamodb[0].arn : null

  tags = merge(
    var.tags,
    {
      "Name" = format("%s", var.name)
    },
  )
}

resource "aws_kms_key" "dynamodb" {
  count                   = var.kms_encription ? 1 : 0
  description             = "KMS key is used to encrypt bucket objects"
  deletion_window_in_days = 7

  tags = merge(
    var.tags,
    {
      "Name" = format("%s", var.name)
    },
  )
}
