Provision LAMP with Terraform script

## Need
 1. AWS credentials
    - aws configure... or
    - export AWS_ACCESS_KEY_ID=...
    - export AWS_SECRET_ACCESS_KEY=...
 2. Create S3 for remote state terraform
    - run script first_create-s3.sh (you will get name terr-state-%hash%) of S3 bucket for a state file)
 3. run > terraform plan
 4. run > terraform apply
 you wil get:
- [+]  data.aws_availability_zones.azs
- [ ]  data.aws_ssm_parameter.linuxAmi
- [ ]  aws_instance.web-master
- [ ]  aws_internet_gateway.igw
- [ ]  aws_key_pair.master-key
- [ ]  aws_lb.application-lb
- [ ]  aws_lb_listener.web-listener-http
- [ ]  aws_lb_target_group.app-lb-tg
- [ ]  aws_lb_target_group_attachment.web-master-attach
- [ ]  aws_main_route_table_association.set-master-default-rt-assoc
- [ ]  aws_route_table.internet_route
- [ ]  aws_security_group.lb-sg
- [ ]  aws_security_group.web-sg
- [ ]  aws_subnet.subnet_1
- [ ]  aws_subnet.subnet_2
- [ ]  aws_vpc.vpc_master

in output you will get DNS URL LoadBalancer 
(exmpl: Loadbalancer-DNS-URL = "web-lb-2039690464.us-east-1.elb.amazonaws.com" )
use this your link for access to setup WP (exmpl:  http://web-lb-2039690464.us-east-1.elb.amazonaws.com)

