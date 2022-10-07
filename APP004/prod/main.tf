data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["vpc-prod-use1"]
  }
}

data "aws_kms_key" "customer_key" {
  key_id = "713104d4-357c-4ced-8b21-741029ab1173"
}

data "aws_subnet" "application_a_subnet" {
  filter {
    name   = "tag:Name"
    values = ["snet-prod-use1-application-a"]
  }
}

data "aws_subnet" "application_b_subnet" {
  filter {
    name   = "tag:Name"
    values = ["snet-prod-use1-application-b"]
  }
}

data "aws_subnet" "db_subnet" {
  filter {
    name   = "tag:Name"
    values = ["snet-prod-use1-data-a"]
  }
}

data "aws_key_pair" "ec2_keypair" {
  key_name           = "hands-on"
  include_public_key = true
}

data "aws_subnet" "alb_subnet_a" {
  filter {
    name   = "tag:Name"
    values = ["snet-prod-use1-public-a"]
  }
}

data "aws_subnet" "alb_subnet_b" {
  filter {
    name   = "tag:Name"
    values = ["snet-prod-use1-public-b"]
  }
}

locals {
  common_tags = {
    app_id      = "APP004",
    department  = "IT",
    environment = "Prod"

  }
}