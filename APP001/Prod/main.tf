data "aws_subnet" "data_subnet_1" {
    tags = {Name="snet-prod-use1-data-a"}
  
}

output "data_subnet_1_id" {
    value = data.aws_subnet.data_subnet_1.id
}