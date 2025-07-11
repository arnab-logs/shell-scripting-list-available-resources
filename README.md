
---

### `README.md`

````markdown
# AWS Resource Lister – Shell Script for DevOps Beginners

Hey there! 
This is a companion script to my blog post where I documented my journey of writing a real-world shell script that interacts with AWS.

> **Goal**: List active AWS resources (like EC2, S3, Lambda, etc.) for a given region and service — in a simple, beginner-friendly way.

This may look like a small script, but it reflects a common DevOps use case — scripts like this often run daily via cron to track infrastructure usage and cost.

---

## What This Script Does

- ✅ Accepts a region and service name as input
- ✅ Validates the input and environment
- ✅ Checks if AWS CLI is installed and configured
- ✅ Lists live resources for supported AWS services
- ✅ Provides clear and helpful messages for beginners

---

## Supported AWS Services

You can use the script to list active resources for the following:

- `ec2` – EC2 Instances  
- `s3` – S3 Buckets  
- `rds` – RDS Databases  
- `dynamodb` – DynamoDB Tables  
- `iam` – IAM Users  
- `cloudformation` – Stacks  
- `vpc` – Virtual Private Clouds  
- `lambda` – Lambda Functions  
- `sns` – SNS Topics  
- `sqs` – SQS Queues  

---

## Example Usage

```bash
./aws_resource_list.sh us-east-1 ec2
./aws_resource_list.sh ap-south-1 s3
````

---

## Prerequisites

Before using this script, make sure:

✅ AWS CLI is installed
✅ You’ve configured your credentials using `aws configure`
✅ You have the required permissions for the AWS services you're querying

---

## Script Overview

Here’s what the script checks for:

1. **Are two arguments passed?** (region & service)
2. **Is AWS CLI installed?**
3. **Is AWS CLI configured (`~/.aws` directory exists)?**
4. **Is the service supported?** If yes → run the relevant AWS CLI command

Each service has a specific command under the hood, like:

```bash
aws ec2 describe-instances --region "$1"
aws s3 ls --region "$1"
aws rds describe-db-instances --region "$1"
```

---

## File Permissions

To make the script executable:

```bash
chmod +x aws_resource_list.sh
```

For shared environments, you may also restrict read/edit access:

```bash
chmod 771 aws_resource_list.sh
```

This means:

* Owner and group can read, write, execute
* Others can only execute (no read/edit)

---

## Why This Matters

This project is about more than just scripting.

It’s about:

* Making the leap from learning syntax → writing something useful
* Thinking about usability, validation, and real-world reliability
* Practicing DevOps thinking — clarity, consistency, and automation

Even a small script like this can save hours, reduce confusion, and improve visibility in your cloud environment.

---

## Blog Post

You can read the full breakdown of how and why this script was written in my blog post:

**[Read the Blog on Hashnode](https://learning-out-loud-my-devops-journey.hashnode.dev/day-4-shell-scripting-project-listing-aws-resources-with-shell-scripts)**

---

## Feedback

If you're learning DevOps or shell scripting, and this helped you — feel free to drop a star ⭐, fork it, or reach out on [GitHub](https://github.com/arnab-logs) or [LinkedIn](www.linkedin.com/in/arnab-nandi-55232a236).

I'm learning too — and would love to hear from others on this path.

---

Thanks for stopping by! 
— Arnab
