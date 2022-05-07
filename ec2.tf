

data "aws_ami" "amzlinux2" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-gp2"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}


# resource "aws_security_group" "web_server" {
#   name        = "web_server"
#   description = "Allow shh inbound traffic from"

#   ingress {
#     description = "ssh from VPC"
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   ingress {
#     description     = "http from VPC"
#     from_port       = 80
#     to_port         = 80
#     protocol        = "tcp"
#     cidr_blocks     = ["0.0.0..0/0"]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

module "ec2_module" {
    source = "./ec2_module" 
    instance_count = 1
    ami = data.aws_ami.amzlinux2.id
    instance_type = "t2micro"
    subnet_id = aws_subnet.public_subnet.id
    vpc-security_group_ids = aws_security_group.web_server.id
    iam_instance_profile = aws_iam_instance_profile.instance_profile.name
    key_name = bastion_instance
}