provider "aws" {
  region = "us-east-1"
}

data "aws_vpc" "default" {
  default = true
}
## Edited in review branch for PR creation

resource "aws_security_group" "allow_web_ssh" {
  name        = "allow_web_ssh"
  description = "Allow HTTP and SSH"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "app_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.allow_web_ssh.id]
  user_data              = templatefile("${path.module}/user_data.sh", {
    repo_url = var.repo_url
  })
  tags = {
    Name = "DevOps-Java21-App"
  }
}

output "public_ip" {
  value = aws_instance.app_server.public_ip
}

output "url" {
  value = "http://${aws_instance.app_server.public_ip}"
}
