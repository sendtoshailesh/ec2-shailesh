





# AWS EC2 and CloudFormation Examples

This repository contains various code snippets, commands, and notes related to AWS EC2 instances and CloudFormation templates.

## Contents

1. [EC2 User Data for Web Server](#ec2-user-data-for-web-server)
2. [Finding Source IP](#finding-source-ip)
3. [EC2 Instance Management](#ec2-instance-management)
4. [EBS Volume Management](#ebs-volume-management)
5. [Auto Scaling Group (ASG) and CloudWatch Alarms](#auto-scaling-group-asg-and-cloudwatch-alarms)
6. [AWS CLI Examples](#aws-cli-examples)
7. [CloudFormation Stack Creation](#cloudformation-stack-creation)

## EC2 User Data for Web Server

A bash script to set up a basic web server on an EC2 instance:

```bash
#!/bin/bash
yum -y install httpd
systemctl enable httpd
systemctl start httpd
echo '<html><h1>Hello From Your Web Server!</h1></html>' > /var/www/html/index.html
```

## Finding Source IP

To find the source IP of your laptop to connect to an EC2 instance from a Macbook:

```
curl ifconfig.me
```

## EC2 Instance Management

- Notes on EC2 key pairs
- SSH connection examples
- Installing and using `stress` for CPU load testing

## EBS Volume Management

Commands for managing EBS volumes:

- Listing block devices
- Formatting and mounting new volumes
- Updating `/etc/fstab` for persistent mounts

## Auto Scaling Group (ASG) and CloudWatch Alarms

Notes on setting up and testing Auto Scaling Groups and CloudWatch Alarms.

## AWS CLI Examples

Various AWS CLI commands for managing EC2 instances:

- Launching instances in EC2-Classic and EC2-VPC
- Specifying security groups and subnets
- Associating public IP addresses

## CloudFormation Stack Creation

Examples of creating CloudFormation stacks using the AWS CLI.

