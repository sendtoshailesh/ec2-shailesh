


ec2 user data for web server

#!/bin/bash
yum -y install httpd
systemctl enable httpd
systemctl start httpd
echo '<html><h1>Hello From Your Web Server!</h1></html>' > /var/www/html/index.html





To find out source IP of laptop to connect EC2 instance from Macbook



*curl ifconfig.me*



https://d2908q01vomqb2.cloudfront.net/17ba0791499db908433b80f37c5fbc89b870084b/2020/03/06/Alexis-AWS-SAP-Blog-Image-2.jpg
 
https://docs.aws.amazon.com/autoscaling/ec2/userguide/auto-scaling-benefits.html
 
 
EC2 Key Pair
 
https://github.com/awsdocs/aws-cloudformation-user-guide/blob/master/doc_source/example-templates-autoscaling.md
 
https://s3.amazonaws.com/cloudformation-templates-us-east-1/AutoScalingMultiAZWithNotifications.template
 
#include
https://s3.amazonaws.com/immersionday-labs/bootstrap.sh
 
ALB, ASG, CW Alarms,  EC2, AMI
 
EBS Volume
 
lsblk
file -s /dev/xvdf
mkfs -t ext4 /dev/xvdf
mkdir /newvolume
mount /dev/xvdf /newvolume/
df -h
 
Run this Bash command to generate disk activity:
while [ true ]; do uuid=$(uuidgen); echo $uuid | sudo tee $uuid.json > /dev/null; done;
 
 
cp /etc/fstab /etc/fstab.bak
Vim /etc/fstab
device_name mount_point file_system_type fs_mntops fs_freq fs_passno
for example : /dev/xvdf /newvolume ext4 defaults 0 0
[root@ip-172-31-22-64 ~]# cat /etc/fstab
#
LABEL=/     /          ext4    defaults,noatime  1   1
tmpfs       /dev/shm    tmpfs  defaults        0   0
devpts      /dev/pts    devpts gid=5,mode=620  0   0
sysfs       /sys        sysfs  defaults        0   0
proc        /proc       proc   defaults        0   0
/dev/xvdf   /newvolume ext4     defaults        0  0
[root@ip-172-31-22-64 ~]#
 
mount -a
 
 
Check the connectivity to app.
reduce the CPU threshold and Alarm time of Autoscaling group.
 
ssh -i key20200415.pem ec2-user@ec2-54-218-117-135.us-west-2.compute.amazonaws.com
 
ls -lt key20200415.pem
 
top    
 
yum install stress -y
stress --cpu 1 --timeout 3000
 
https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/sample-templates-services-us-west-2.html#w2ab1c27c58c13c17
 
 
        
Stress can be installed on Linux instances by running:
 
# yum install stress -y
Once installed, CPU load can be generated using Stress by running:
 
[root@ip]# stress --cpu 10 --timeout 3000
stress: info: [2919] dispatching hogs: 1 cpu, 0 io, 0 vm, 0 hdd
 
You can use stress command in Linux:
 
stress --cpu 10 timeout 6000
cpu specifies the number of cores, timeout specifies the number of seconds this command will run.
 
For Windows: Install Windows Server 2003 Resource Toolkit. Then run this command in cmd:
 
consume -cpu-time -time 5000
 
 
 
 
https://docs.aws.amazon.com/cli/latest/reference/ec2/run-instances.html
 
https://docs.aws.amazon.com/cli/latest/reference/ec2/run-instances.html#examples
 
aws ec2 run-instances \
    --image-id ami-1a2b3c4d \
    --count 1 \
    --instance-type c3.large \
    --key-name MyKeyPair \
    --security-groups MySecurityGroup
 
aws ec2 run-instances \
    --image-id ami-1a2b3c4d \
    --count 1 \
    --instance-type c3.large \
    --key-name MyKeyPair \
    --security-groups MySecurityGroup \
    --dry-run   
 
aws cloudformation create-stack  --stack-name startmyinstance  
    --template-body file://home/ec2-user/templates/startmyinstance.json
    --parameters  ParameterKey=KeyPairName,ParameterValue=MyKey ParameterKey=InstanceType,ParameterValue=t1.micro
    
    
aws cloudformation create-stack  --stack-name startmyinstance  \
    --template-url https://s3.amazonaws.com/cloudformation-templates-us-east-1/AutoScalingMultiAZWithNotifications.template\
    --parameters  ParameterKey=KeyName,ParameterValue=Key1 ParameterKey=InstanceType,ParameterValue=t1.micro
 
 
 
 
 
 
Example 1: To launch an instance in EC2-Classic
 
The following run-instances example launches a single instance of type c3.large. The key pair and security group must already exist.
 
aws ec2 run-instances \
    --image-id ami-1a2b3c4d \
    --count 1 \
    --instance-type c3.large \
    --key-name MyKeyPair \
    --security-groups MySecurityGroup
    
 
 
Example 2: To launch an instance in EC2-VPC
 
The following run-instances example launches a single instance of type t2.micro into the specified subnet. 
The key pair and the security group must already exist.
 
aws ec2 run-instances \
    --image-id ami-abc12345 \
    --count 1 \
    --instance-type t2.micro \
    --key-name MyKeyPair \
    --security-group-ids sg-1a2b3c4d \
    --subnet-id subnet-6e7f829e
    
    
Example 3: To launch an instance into a non-default subnet and add a public IP address
 
The following run-instances example requests a public IP address for an instance that you're launching into a nondefault subnet.
 
aws ec2 run-instances \
    --image-id ami-c3b8d6aa \
    --count 1 \
    --instance-type t2.medium \
    --key-name MyKeyPair \
    --security-group-ids sg-903004f8 \
    --subnet-id subnet-6e7f829e \
    --associate-public-ip-address
 
 



