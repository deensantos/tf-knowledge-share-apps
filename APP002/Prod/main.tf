data "aws_vpc" "mainVPC" {
    filter {
    name   = "tag:Name"
    values = ["vpc-prod-use1"]
  }

  
}
output "vpc_id" {
    value = data.aws_vpc.mainVPC.id
  
}