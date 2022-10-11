data "aws_vpc" "app07_vpc" {
  filter {
    name = "tag:Name"
    values = ["vpc-prod-use1"]
  }
}

locals {
  tags = {
    AppID = "App07"
    Env = "Prod"
    Department = "IT"
  }
}