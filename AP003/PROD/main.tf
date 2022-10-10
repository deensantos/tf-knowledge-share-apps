locals {
  tags = {
    APPID = var.app_id,
    Env = var.environment,
    Department = "IT"
  }
  # us-east-1 -> us e 1 -> use1
  region = lower(format("%s%s%s", substr(var.region, 0, 2), substr(var.region, 3, 1), substr(var.region, -1, 1)))
}

data "aws_vpc" "main_vpc" {
  filter {
    name = "tag:Name"
    values = [lower("vpc-${var.environment}-${local.region}")]
  }
}
output "vpc_outputs" {
  value = data.aws_vpc.main_vpc.id
}


data "aws_kms_key" "customer_key" {
  key_id = "713104d4-357c-4ced-8b21-741029ab1173"
}

data "aws_subnet" "application_subnet" {
  filter {
    name = "tag:Name"
    values = [lower("snet-${var.environment}-${local.region}-application-${var.az[0]}")] # indexes ["a","b","a"] 
  }
}

data "aws_subnet" "database_subnet" {
  filter {
    name = "tag:Name"
    values = [lower("snet-${var.environment}-${local.region}-data-${var.az[2]}")] # indexes ["a","b","a"] 
  }
}

data "aws_subnet" "public_subnet_a" {
  filter {
    name = "tag:Name"
    values = [lower("snet-${var.environment}-${local.region}-public-${var.alb_az[0]}")] # indexes ["a","b"]
  }
}

data "aws_subnet" "public_subnet_b" {
  filter {
    name = "tag:Name"
    values = [lower("snet-prod-use1-public-${var.alb_az[1]}")] # indexes ["a","b"]
  }
}
