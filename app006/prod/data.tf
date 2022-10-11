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