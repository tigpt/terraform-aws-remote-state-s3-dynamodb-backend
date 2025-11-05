###########################
#--- S3 Backend Bucket ---#
###########################

module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.1.0"

  bucket = "tf-${var.name}-${random_integer.random.id}-state"
  acl    = "private"

  object_lock_enabled      = true
  control_object_ownership = true
  object_ownership         = "ObjectWriter"
  allowed_kms_key_arn      = var.kms_encription ? aws_kms_key.objects[0].arn : null

  server_side_encryption_configuration = var.kms_encription ? {
    rule = {
      apply_server_side_encryption_by_default = {
        kms_master_key_id = aws_kms_key.objects[0].arn
        sse_algorithm     = "aws:kms"
      }
    }
  } : null

  force_destroy = true

  versioning = {
    enabled = true
  }
  attach_policy = true
  policy        = <<POLICY
{
  "Statement": [
    {
      "Sid": "bucket-delete-protection",
      "Action": [
        "s3:DeleteBucketPolicy",
        "s3:DeleteBucket"
      ],
      "Effect": "Deny",
      "Resource": "arn:aws:s3:::tf-${var.name}-${random_integer.random.id}-state",
      "Principal": {
        "AWS": [
          "*"
        ]
      }
    }
  ]
}
POLICY

  tags = merge(
    var.tags,
    {
      "Name" = format("%s", var.name)
    },
  )
}

resource "aws_kms_key" "objects" {
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

