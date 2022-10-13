locals {
  tags = {
    AppID      = var.app_id
    Env        = var.env
    Department = var.department
  }
  region = lower(format("%s%s%s", substr(var.region, 0, 2), substr(var.region, 3, 1), substr(var.region, -1, 1)))
}


data "aws_vpc" "app07_vpc" {
  filter {
    name   = "tag:Name"
    values = ["vpc-${var.env}-${local.region}"]
  }
}

data "aws_kms_key" "Default_key" {
  key_id = "713104d4-357c-4ced-8b21-741029ab1173"
}

data "aws_subnet" "app07_subnet_a" {
  filter {
    name   = "tag:Name"
    values = ["snet-${var.env}-${local.region}-application-a"]
  }
}

data "aws_subnet" "app07_subnet_b" {
  filter {
    name   = "tag:Name"
    values = ["snet-${var.env}-${local.region}-application-b"]
  }
}

data "aws_subnet" "app07_subnet_db_a" {
  filter {
    name   = "tag:Name"
    values = ["snet-${var.env}-${local.region}-data-a"]
  }
}

data "aws_subnet" "app07_subnet_db_b" {
  filter {
    name   = "tag:Name"
    values = ["snet-${var.env}-${local.region}-data-b"]
  }
}

data "aws_subnet" "app07_subnet_lb_a" {
  filter {
    name   = "tag:Name"
    values = ["snet-${var.env}-${local.region}-public-a"]
  }
}

data "aws_subnet" "app07_subnet_lb_b" {
  filter {
    name   = "tag:Name"
    values = ["snet-${var.env}-${local.region}-public-b"]
  }
}


