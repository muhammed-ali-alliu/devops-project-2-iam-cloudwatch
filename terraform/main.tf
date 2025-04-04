resource "aws_s3_bucket" "secure_bucket" {
  bucket = var.bucket_name

  versioning {
    enabled = true
  }

  tags = {
    Name        = "Versioned Bucket"
    Environment = "Dev"
  }
}

resource "aws_iam_user" "limited_user" {
  name = "devops-limited-user"
}

resource "aws_iam_user_policy" "s3_access_policy" {
  name = "S3AccessPolicy"
  user = aws_iam_user.limited_user.name

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = ["s3:ListBucket", "s3:GetObject"],
        Effect = "Allow",
        Resource = [
          aws_s3_bucket.secure_bucket.arn,
          "${aws_s3_bucket.secure_bucket.arn}/*"
        ]
      }
    ]
  })
}

resource "aws_instance" "monitored_instance" {
  ami           = "ami-f976839e" # Amazon Linux 2 for eu-west-2
  instance_type = var.instance_type

  tags = {
    Name = "Monitored EC2"
  }
}

resource "aws_cloudwatch_metric_alarm" "cpu_alarm" {
  alarm_name          = "HighCPUAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = var.alarm_threshold
  alarm_description   = "Alarm when CPU exceeds threshold"
  dimensions = {
    InstanceId = aws_instance.monitored_instance.id
  }
}
