data "aws_key_pair" "project_key" {
  key_name = "hands-on"
}

data "aws_kms_key" "customer_key" {
  key_id = "713104d4-357c-4ced-8b21-741029ab1173"
}

data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["vpc-prod-use1"]
  }
}

data "aws_subnet" "public_a" {
  filter {
    name   = "tag:Name"
    values = ["snet-prod-use1-public-a"] #10.0.5.0/24
  }
}

data "aws_subnet" "public_b" {
  filter {
    name   = "tag:Name"
    values = ["snet-prod-use1-public-b"] #10.0.6.0/24
  }
}

data "aws_subnet" "application_a_subnet" {
  filter {
    name   = "tag:Name"
    values = ["snet-prod-use1-application-a"] #10.0.1.0/24
  }
}

data "aws_subnet" "application_b_subnet" {
  filter {
    name   = "tag:Name"
    values = ["snet-prod-use1-application-b"] #10.0.2.0/24
  }
}

data "aws_subnet" "data_a_subnet" {
  filter {
    name   = "tag:Name"
    values = ["snet-prod-use1-data-a"] #10.0.3.0/24
  }
}

data "aws_subnet" "data_b_subnet" {
  filter {
    name   = "tag:Name"
    values = ["snet-prod-use1-data-b"] #10.0.4.0/24
  }
}


