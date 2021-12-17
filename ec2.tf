#Get Linux AMI ID using SSM Parameter endpoint in us-east-1
data "aws_ssm_parameter" "linuxAmi" {
  provider = aws.region-master
  #  name     = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
  name = "/aws/service/canonical/ubuntu/server/20.04/stable/current/amd64/hvm/ebs-gp2/ami-id"
}


#Create key-pair for logging into EC2 in us-east-1
resource "aws_key_pair" "master-key" {
  provider   = aws.region-master
  key_name   = "key-web"
  public_key = file("~/.ssh/ec2-key.pub")
}

#Create and bootstrap EC2 in us-east-1
resource "aws_instance" "web-master" {
  provider                    = aws.region-master
  //count                       = var.web-count
  ami                         = data.aws_ssm_parameter.linuxAmi.value
  instance_type               = var.instance-type
  key_name                    = aws_key_pair.master-key.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.web-sg.id]
  subnet_id                   = aws_subnet.subnet_1.id
  tags = {
  //  Name = join("_", ["web_master_tf", count.index + 1])
      Name = "web-master"
  }

  // copy our example script to the server
  provisioner "file" {
    source      = "./scripts/install-app.sh"
    destination = "/tmp/install-app.sh"
  }

  // copy config for site 
  provisioner "file" {
    source      = "./web/wp.conf"
    destination = "/tmp/wp.conf"
  }

  // change permissions to executable and pipe its output into a new file
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/install-app.sh",
      "/tmp/install-app.sh > /tmp/install.log",
      "sudo rm /var/www/html/index.html",
    ]
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/.ssh/ec2-key")
    host        = self.public_ip
  }

  depends_on = [aws_main_route_table_association.set-master-default-rt-assoc]

}


