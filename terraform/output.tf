output "bucket_name" {
  value = aws_s3_bucket.secure_bucket.bucket
}

output "iam_user_name" {
  value = aws_iam_user.limited_user.name
}

output "ec2_instance_id" {
  value = aws_instance.monitored_instance.id
}
