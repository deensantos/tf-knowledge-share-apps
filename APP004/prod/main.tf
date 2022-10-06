data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["vpc-prod-use1"]
  }
}

locals {
  common_tags = {
    app_id = "APP004",
    department = "IT",
    environment = "Prod"

  }
}