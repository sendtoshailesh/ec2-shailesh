





# ec2.sh: AWS EC2 and CloudFormation Examples

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







------------------------------------------------------------------------------------

Certainly! Here's a summary of the code in GitHub README format:

# Auto Scaling Group Setup with AWS CLI

This repository contains AWS CLI commands to set up and configure an Auto Scaling group for maintaining high availability.

## Contents

1. [Create Launch Configuration](#create-launch-configuration)
2. [Create Auto Scaling Group](#create-auto-scaling-group)
3. [Tag Auto Scaling Resource](#tag-auto-scaling-resource)
4. [Create Auto Scaling Policies](#create-auto-scaling-policies)

## Create Launch Configuration

```bash
aws autoscaling create-launch-configuration \
    --image-id AMIID \
    --instance-type t3.micro \
    --key-name KEYNAME \
    --security-groups EC2SECURITYGROUPID \
    --user-data file:///home/ec2-user/as-bootstrap.sh \
    --launch-configuration-name lab-lc
```

This command creates a launch configuration for the Auto Scaling group, specifying the AMI, instance type, key pair, security group, and user data script.

## Create Auto Scaling Group

```bash
aws autoscaling create-auto-scaling-group \
    --auto-scaling-group-name lab-as-group \
    --launch-configuration-name lab-lc \
    --load-balancer-names LOADBALANCER \
    --max-size 4 \
    --min-size 1 \
    --vpc-zone-identifier SUBNET1,SUBNET2
```

This command creates an Auto Scaling group using the previously created launch configuration, specifying the load balancer, group size limits, and VPC subnets.

## Tag Auto Scaling Resource

```bash
aws autoscaling create-or-update-tags \
    --tags "ResourceId=lab-as-group, ResourceType=auto-scaling-group, Key=Name, Value=AS-Web-Server, PropagateAtLaunch=true"
```

This command adds a tag to the Auto Scaling group, which will be propagated to the EC2 instances launched by the group.

## Create Auto Scaling Policies

### Scale Up Policy

```bash
aws autoscaling put-scaling-policy \
    --policy-name lab-scale-up-policy \
    --auto-scaling-group-name lab-as-group \
    --scaling-adjustment 1 \
    --adjustment-type ChangeInCapacity \
    --cooldown 300 \
    --query 'PolicyARN' \
    --output text
```

This command creates a scaling policy to increase the capacity of the Auto Scaling group by 1 instance, with a cooldown period of 300 seconds.

### Scale Down Policy

```bash
aws autoscaling put-scaling-policy \
    --policy-name lab-scale-down-policy \
    --auto-scaling-group-name lab-as-group \
    --scaling-adjustment -1 \
    --adjustment-type ChangeInCapacity \
    --cooldown 300 \
    --query 'PolicyARN' \
    --output text
```

This command creates a scaling policy to decrease the capacity of the Auto Scaling group by 1 instance, with a cooldown period of 300 seconds.

---

These commands set up a complete Auto Scaling group with associated policies for maintaining high availability. Remember to replace placeholders like `AMIID`, `KEYNAME`, `EC2SECURITYGROUPID`, `LOADBALANCER`, `SUBNET1`, and `SUBNET2` with your specific values.

