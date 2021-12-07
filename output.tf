output "aws_ec2-key_master" {
  value = aws_key_pair.master-key.id
}

output "WEB-Node-Public-IP" {
  value = {
    for instance in aws_instance.web-master :
    instance.id => instance.public_ip
  }
}

#output "LB-DNS-NAME" {
#  value = aws_lb.application-lb.dns_name
#}

#output "url" {
#  value = aws_route53_record.jenkins.fqdn
#}