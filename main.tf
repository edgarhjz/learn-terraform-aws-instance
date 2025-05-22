terraform {
  cloud {
    organization = "cinammon-org" # app.terraform.io
    workspaces {
      name = "learn-terraform-aws"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0953476d60561c955" # Amazon Linux 2023 AMI 2023.7.20250512.0 x86_64 HVM kernel-6.1
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}

