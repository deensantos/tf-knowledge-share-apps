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

data "aws_subnet" "app_subnet_1" {
  filter {
    name   = "tag:Name"
    values = ["snet-${var.env}-${local.region}-application-${var.az[0]}"]
  }
}

data "aws_subnet" "app_subnet_2" {
  filter {
    name   = "tag:Name"
    values = ["snet-${var.env}-${local.region}-application-${var.az[1]}"]
  }
}

data "aws_subnet" "db_subnet_1" {
  filter {
    name   = "tag:Name"
    values = ["snet-${var.env}-${local.region}-data-${var.az[2]}"]
  }
}

data "aws_subnet" "lb_subnet_1" {
  filter {
    name   = "tag:Name"
    values = ["snet-${var.env}-${local.region}-public-${var.az[3]}"]
  }
}

data "aws_subnet" "lb_subnet_2" {
  filter {
    name   = "tag:Name"
    values = ["snet-${var.env}-${local.region}-public-${var.az[4]}"]
  }
}

