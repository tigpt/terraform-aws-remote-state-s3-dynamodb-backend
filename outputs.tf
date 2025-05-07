###########################
#--- S3 Backend Bucket ---#
###########################

output "tf_state_s3_bucket_name" {
  value = module.s3_bucket.s3_bucket_id
}

output "tf_state_s3_bucket_arn" {
  value = module.s3_bucket.s3_bucket_arn
}
