locals {
  common_tags = {
    app_id = "app006",
    env = "Prod",
    Department = "IT"
  }
}

data "aws_vpc" "default_vpc" {
  filter {
    name   = "tag:Name"
    values = ["vpc-prod-use1"]
  }
  }
data "aws_subnet" "app_subnet" {
  tags = {
    Name = "snet-prod-use1-application-a"
  }
}

data "aws_subnet" "app_subnet_b" {
  tags = {
    Name = "snet-prod-use1-application-b"
  }
}

data "aws_subnet" "db_subnet_a" {
  tags = {
    Name = "snet-prod-use1-data-a"
  }
}

data "aws_subnet" "alb_prod_pub_subnet_a" {
  tags = {
    Name = "snet-prod-use1-public-a"
  }
}

data "aws_subnet" "alb_prod_pub_subnet_b" {
  tags = {
    Name = "snet-prod-use1-public-b"
  }
}

data "aws_kms_key" "default_key" {
  key_id = "713104d4-357c-4ced-8b21-741029ab1173"  
}