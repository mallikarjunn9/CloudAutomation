provider "aws" {
  region = "ap-south-1"

}

resource "aws_instance" "AmazonLinux2" {
  ami = "ami-0bcf5425cdc1d8a85"
  instance_type = "t2.micro"
  tags = {
      Name = "us-innovation-devlinux"

  }

  key_name = "Practise-aws"
  user_data = <<-EOF
                #!/bin/bash
                yum update -y
                yum install -y httpd
                systemctl start httpd.service
                systemctl enable httpd.service
                echo "Hi Friend , I am $(hostname -f) hosted by Terraform" > /var/www/html/index.html
                EOF
}

resource "aws_security_group" "webfirewall" {
  name        = "webfirewall"
  description = "Allow SSH connection for ec2"
  vpc_id      = "vpc-2ffdea47"

  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Allow Http web application on this server"
 }
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    description      = "Allow ssh connection on this server"
 }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
   tags = {
    Name = "webfirewall"
  }
}
