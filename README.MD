# 🔐 Project 2 — AWS IAM + CloudWatch Monitoring with Terraform

## 🚀 Overview

This project provisions a secure and monitorable AWS environment using **Terraform**. It includes:
- A versioned **S3 bucket**
- A scoped **IAM user** with limited access to that bucket
- A **CloudWatch alarm** that monitors an EC2 instance’s CPU usage
- All infrastructure defined using **Infrastructure as Code (IaC)**

---

## 🧱 Architecture

         +---------------------+
         |     AWS Cloud      |
         +---------------------+
         |                     |
         |   +-------------+   |
         |   |  S3 Bucket  |<--+ IAM User (Read-only)
         |   +-------------+   |
         |                     |
         |   +-------------+   |
         |   |   EC2 VM    |   |
         |   +-------------+   |
         |         |           |
         |   CloudWatch Alarm  |
         +---------------------+



---

## 🛠️ Technologies Used

- **Terraform**
- **AWS**
  - S3 (with versioning)
  - EC2
  - IAM
  - CloudWatch
- Git & GitHub

---

## 🔧 How to Deploy

1. Clone this repo  
2. Navigate to the terraform folder:
cd terraform
3. Initialize Terraform: terraform init
4. Deploy the infrastructure: terraform apply -var="bucket_name=your-bucket-name"

🧹 How to Destroy
To avoid AWS charges:

terraform destroy -var="bucket_name=your-bucket-name"

⭐ STAR Story
Situation:
I wanted to simulate a secure, observable cloud environment using Terraform and AWS.

Task:
Provision a versioned S3 bucket, a limited-access IAM user, an EC2 instance, and a CloudWatch alarm.

Action:
I wrote Terraform configs to define the resources, scoped IAM access using a custom inline policy, deployed an EC2 instance, and added a CloudWatch alarm to monitor CPU usage.

Result:
All resources were successfully deployed and verified in the AWS Console. I can now build secure cloud environments with monitoring baked in — a key requirement in real DevOps teams.

📝 Lessons Learned
How to scope IAM permissions using jsonencode()

How CloudWatch alarms are attached to EC2 metrics

How to verify infra in AWS Console after applying Terraform

How to clean up infra with terraform destroy