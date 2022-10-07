locals {
  tags = {
    APPID = "APP003",
    Env = "Prod",
    Department = "IT"
  }
}

data "aws_vpc" "main_vpc" {
  filter {
    name = "tag:Name"
    values = ["vpc-prod-use1"]
  }
}
output "vpc_outputs" {
  value = data.aws_vpc.main_vpc.id
}

data "aws_kms_key" "customer_key" {
  key_id = "713104d4-357c-4ced-8b21-741029ab1173"
}


data "aws_subnet" "application_subnet" {
  filter {
    name = "tag:Name"
    values = ["snet-prod-use1-application-a"]
  }
}

data "aws_subnet" "database_subnet" {
  filter {
    name = "tag:Name"
    values = ["snet-prod-use1-data-a"]
  }
}

data "aws_subnet" "public_subnet_a" {
  filter {
    name = "tag:Name"
    values = ["snet-prod-use1-public-a"]
  }
}

data "aws_subnet" "public_subnet_b" {
  filter {
    name = "tag:Name"
    values = ["snet-prod-use1-public-b"]
  }
}
