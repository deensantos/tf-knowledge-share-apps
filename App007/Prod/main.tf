data "aws_vpc" "app07_vpc" {
  filter {
    name   = "tag:Name"
    values = ["vpc-prod-use1"]
  }
}

data "aws_kms_key" "Default_key" {
  key_id = "713104d4-357c-4ced-8b21-741029ab1173"
}

data "aws_subnet" "app07_subnet_a" {
  filter {
    name   = "tag:Name"
    values = ["snet-prod-use1-application-a"]
  }
}

data "aws_subnet" "app07_subnet_b" {
  filter {
    name   = "tag:Name"
    values = ["snet-prod-use1-application-b"]
  }
}

data "aws_subnet" "app07_subnet_db_a" {
  filter {
    name   = "tag:Name"
    values = ["snet-prod-use1-data-a"]
  }
}

data "aws_subnet" "app07_subnet_db_b" {
  filter {
    name   = "tag:Name"
    values = ["snet-prod-use1-data-b"]
  }
}

data "aws_subnet" "app07_subnet_lb_a" {
  filter {
    name   = "tag:Name"
    values = ["snet-prod-use1-public-a"]
  }
}

data "aws_subnet" "app07_subnet_lb_b" {
  filter {
    name   = "tag:Name"
    values = ["snet-prod-use1-public-b"]
  }
}

locals {
  tags = {
    AppID      = "App07"
    Env        = "Prod"
    Department = "IT"
  }
}