Provision LAMP with Terraform script

## Need
 1. AWS credentials
 ```json
    [my-awsuser]
         aws_access_key_id = * your ID*
         aws_secret_access_key = * your access key *
         region = us-east-1
         output = json
         cli_pager = 
```
 2. Create S3 for remote state terraform
    - run script 
    ``` first_create-s3.sh ``` (you will get name terr-state-%hash%) of S3 bucket for a state file)
 3. run 
 ```php 
    terraform plan 
 ```
 4. run 
 ```shell 
    terraform apply
 ```
 you wil get:
- [X]  data.aws_availability_zones.azs
- [X]  data.aws_ssm_parameter.linuxAmi
- [X]  aws_instance.web-master
- [X]  aws_internet_gateway.igw
- [X]  aws_key_pair.master-key
- [X]  aws_lb.application-lb
- [X]  aws_lb_listener.web-listener-http
- [X]  aws_lb_target_group.app-lb-tg
- [X]  aws_lb_target_group_attachment.web-master-attach
- [X]  aws_main_route_table_association.set-master-default-rt-assoc
- [X]  aws_route_table.internet_route
- [X]  aws_security_group.lb-sg
- [X]  aws_security_group.web-sg
- [X]  aws_subnet.subnet_1
- [X]  aws_subnet.subnet_2
- [X]  aws_vpc.vpc_master

in output you will get DNS URL LoadBalancer    
*exmpl: Loadbalancer-DNS-URL = "web-lb-2039690464.us-east-1.elb.amazonaws.com" )*
use this your link for access to setup WP *(exmpl:  http://web-lb-2039690464.us-east-1.elb.amazonaws.com)*

