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

locals {
  common_tags = {
    app_id = "APP004",
    department = "IT",
    environment = "Prod"

  }
}