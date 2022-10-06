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
