output "aws_ec2-key_master" {
  value = aws_key_pair.master-key.id
}

output "WEB-Node-Public-IP" {
value = aws_instance.web-master.public_ip
//  value = {
//    for instance in aws_instance.web-master :
//    instance.id => instance.public_ip
//  }
}

output "Loadbalancer-DNS-URL" {
  value = aws_lb.application-lb.dns_name
}

#output "url" {
#  value = aws_route53_record.jenkins.fqdn
#}