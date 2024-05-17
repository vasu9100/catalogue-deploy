data "aws_ssm_parameter" "vpc_id" {
  name = "/Roboshop/dev/vpc_id"  # This should be the path where your VPC ID parameter is stored in Parameter Store
}

data "aws_ami" "devops_practice_ami" {
  
  most_recent      = true
  owners           = ["973714476881"]

  filter {
    name   = "name"
    values = ["Centos-8-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ssm_parameter" "catalogue_sg_ssm" {
  name = "/Roboshop/dev/catalogue_id"
  
}

data "aws_ssm_parameter" "private_subnet_ssm" {
  name = "/Roboshop/dev/private_subnet_id"
  
}

data "aws_ssm_parameter" "app_alb_listener_arn_ssm" {
  name = "/Roboshop/dev/app_alb_listener_arn_id"
}