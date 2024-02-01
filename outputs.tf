###########################
#--- S3 Backend Bucket ---#
###########################

output "tf_state_s3_bucket_name" {
  value = module.s3_bucket.s3_bucket_id
}

output "tf_state_s3_bucket_arn" {
  value = module.s3_bucket.s3_bucket_arn
}

#############################
#--- DynamoDB State Lock ---#
#############################

output "tf_state_dynamodb_name" {
  value = "${var.name}-${random_integer.random.id}-locktable"
}

output "tf_state_dynamodb_arn" {
  value = module.dynamodb_table.dynamodb_table_arn
}