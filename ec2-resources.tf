# Public subnet EC2 instance 1
resource "aws_instance" "two-tier-web-server-1" {
  ami             = "ami-03cceb19496c25679"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.two-tier-ec2-sg.id]
  subnet_id       = aws_subnet.two-tier-pub-sub-1.id
  key_name   = "YOUR KEY PAIR"

  tags = {
    Name = "two-tier-web-server-1"
  }

  user_data = <<-EOF
#!/bin/bash
sudo yum update -y
sudo yum install httpd -y 
sudo systemctl enable httpd
sudo systemctl start httpd
EOF
}

# Public subnet  EC2 instance 2
resource "aws_instance" "two-tier-web-server-2" {
  ami             = "ami-03cceb19496c25679"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.two-tier-ec2-sg.id]
  subnet_id       = aws_subnet.two-tier-pub-sub-2.id
  key_name   = "YOUR KEY PAIR"

  tags = {
    Name = "two-tier-web-server-2"
  }

  user_data = <<-EOF
#!/bin/bash
sudo yum update -y
sudo yum install httpd -y 
sudo systemctl enable httpd
sudo systemctl start httpd
EOF
}

#ELASTIC IP

#resource "aws_eip" "two-tier-web-server-1-eip" {
#vpc = true
# instance                  = aws_instance.two-tier-web-server-1.id
#depends_on                = [aws_internet_gateway.two-tier-igw]
#}

#resource "aws_eip" "two-tier-web-server-2-eip" {
#vpc = true

#instance                  = aws_instance.two-tier-web-server-2.id
#depends_on                = [aws_internet_gateway.two-tier-igw]
#}
