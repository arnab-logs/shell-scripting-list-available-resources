#!/bin/bash

###########################################################################################
# This script lists all active resources for a specified AWS service in a given region
# Author: Arnab / DevOps Team
# Version: v0.1

# Supported AWS services (only these are allowed as input):
#   - ec2
#   - s3
#   - rds
#   - dynamodb
#   - iam
#   - cloudformation
#   - vpc
#   - lambda
#   - sns
#   - sqs

# Usage:
#   ./aws_resource_list.sh <region> <service_name>
#
# Example:
#   ./aws_resource_list.sh us-east-1 ec2
##########################################################################################

#Check if the required number of arguments are passed 
if [ $# -ne 2 ]; then
echo "Usage: $0 <region> <sevice_name>"
exit 1
fi

#Check if AWS CLI is installed 
if ! command -v aws && /dev/null; then
echo "AWS CLI is not installed. Please install it and try again."
exit 1 
fi

#Check if the AWS CLI is configured
if [ ! -d ~/.aws ]; then
echo "AWS CLI is not configured. PLease configure it and try again."
exit 1
fi

#Execute the AS CLI command based on the service name 
case $2 in
  ec2)
    aws ec2 describe-instances --region "$1"
    ;;
  s3)
    aws s3api list-buckets --region "$1"
    ;;
  rds)
    aws rds describe-db-instances --region "$1"
    ;;
  dynamodb)
    aws dynamodb list-tables --region "$1"
    ;;
  iam)
    aws iam list-users
    ;;
  cloudformation)
    aws cloudformation describe-stacks --region "$1"
    ;;
  vpc)
    aws ec2 describe-vpcs --region "$1"
    ;;
  lambda)
    aws lambda list-functions --region "$1"
    ;;
  sns)
    aws sns list-topics --region "$1"
    ;;
  sqs)
    aws sqs list-queues --region "$1"
    ;;
  *)
    echo "Invalid service name. Please choose a supported service."
    exit 1
    ;;
esac