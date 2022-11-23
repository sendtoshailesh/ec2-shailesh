qwiklabs - Maintaining High Availability with Auto Scaling


Create launch group

aws autoscaling create-launch-configuration --image-id AMIID --instance-type t3.micro --key-name KEYNAME --security-groups EC2SECURITYGROUPID --user-data file:///home/ec2-user/as-bootstrap.sh --launch-configuration-name lab-lc


create autoscaling group
aws autoscaling create-auto-scaling-group --auto-scaling-group-name lab-as-group --launch-configuration-name lab-lc --load-balancer-names LOADBALANCER --max-size 4 --min-size 1 --vpc-zone-identifier SUBNET1,SUBNET2

tag autoscaling resource
aws autoscaling create-or-update-tags --tags "ResourceId=lab-as-group, ResourceType=auto-scaling-group, Key=Name, Value=AS-Web-Server, PropagateAtLaunch=true"


create autoscaling policy
aws autoscaling put-scaling-policy --policy-name lab-scale-up-policy --auto-scaling-group-name lab-as-group --scaling-adjustment 1 --adjustment-type ChangeInCapacity --cooldown 300 --query 'PolicyARN' --output text

aws autoscaling put-scaling-policy --policy-name lab-scale-down-policy --auto-scaling-group-name lab-as-group --scaling-adjustment -1 --adjustment-type ChangeInCapacity --cooldown 300 --query 'PolicyARN' --output text

