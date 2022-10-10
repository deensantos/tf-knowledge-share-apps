locals {
  common_tags = {
    app_id      = upper(var.app_id),
    department  = "IT",
    environment = lower(var.env)

  }
                                        #us                       #e                            #1            
  region = lower(format("%s%s%s", substr(var.aws_region, 0, 2), substr(var.aws_region, 3, 1), substr(var.aws_region, -1, 1)))
  volume_type = coalesce(var.vol_type,var.env == "prod" ? "gp3" : "gp2")
  root_vol_size = coalesce(var.vol_size,var.env == "prod" ? "30" : "40")
}


data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = [lower("vpc-${var.env}-${local.region}")]
  }
}

data "aws_kms_key" "customer_key" {
  key_id = "713104d4-357c-4ced-8b21-741029ab1173"
}

data "aws_subnet" "application_a_subnet" {
  filter {
    name   = "tag:Name"
    values = [lower("snet-${var.env}-${local.region}-application-${var.az[0]}")]
  }
}

data "aws_subnet" "application_b_subnet" {
  filter {
    name   = "tag:Name"
    values = [lower("snet-${var.env}-${local.region}-application-${var.az[1]}")]
  }
}

data "aws_subnet" "db_subnet" {
  filter {
    name   = "tag:Name"
    values = [lower("snet-${var.env}-${local.region}-data-${var.az[0]}")]
  }
}

data "aws_key_pair" "ec2_keypair" {
  key_name           = "hands-on"
  include_public_key = true
}

data "aws_subnet" "alb_subnet_a" {
  filter {
    name   = "tag:Name"
    values = [lower("snet-${var.env}-${local.region}-public-${var.az_alb[0]}")]
  }
}

data "aws_subnet" "alb_subnet_b" {
  filter {
    name   = "tag:Name"
    values = [lower("snet-${var.env}-${local.region}-public-${var.az_alb[1]}")]
  }
}

data "aws_subnet" "public_a_subnet" {
  filter {
    name   = "tag:Name"
    values = ["snet-prod-use1-public-a"]
  }
}
