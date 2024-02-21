terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region     = "eu-central-1"
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
}

// To Generate Private Key
resource "tls_private_key" "rsa_4096" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

variable "key_name" {
  description = "game"
}

// Create Key Pair for Connecting EC2 via SSH
resource "aws_key_pair" "key_pair" {
  key_name   = var.key_name
  public_key = tls_private_key.rsa_4096.public_key_openssh
}

// Save PEM file locally
resource "local_file" "private_key" {
  content  = tls_private_key.rsa_4096.private_key_pem
  filename = var.key_name
}

# Create a security group
resource "aws_security_group" "sg_ec2" {
  name        = "sg_ec2_"
  description = "Security group for EC2"

  ingress {
    from_port   = 22
    to_port     = 22
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

resource "aws_instance" "game-server" {
  count                  = 1
  ami                    = "ami-0972a4c30cc617cd4"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.key_pair.key_name
  vpc_security_group_ids = [aws_security_group.sg_ec2.id]  # Use the same security group for all instances

  tags = {
    Name = "public_instance-${count.index + 1}"  # Adding index to make unique tags
  }

  root_block_device {
    volume_size = 30
    volume_type = "gp2"
  }
}

data "template_file" "inventory" {
  template = <<-EOT
    [ec2_instances]
    % for instance in aws_instance.game-server:
    ${instance.private_ip} ansible_user=ubuntu ansible_private_key_file=${path.module}/${var.key_name}
    % endfor
    EOT
}

resource "local_file" "dynamic_inventory" {
  depends_on = [data.template_file.inventory]

  filename = "dynamic_inventory.ini"
  content  = data.template_file.inventory.rendered
}

resource "null_resource" "run_ansible" {
  depends_on = [local_file.dynamic_inventory]

  provisioner "local-exec" {
    command     = "chmod 400 ${local_file.dynamic_inventory.filename} && ansible-playbook -i dynamic_inventory.ini install-docker-on-ubuntu.yml"
    working_dir = path.module
  }
}
