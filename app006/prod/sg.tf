resource "aws_security_group" "app_sg" {
    name        = "app001-prod-use1-app"
    description = "Allow traffic to application"
    vpc_id      = data.aws_vpc.default_vpc.id

  ingress {
    description      = "Access from LB"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
    # security_groups = []
  }

  tags = merge(local.common_tags,{Name = "sg-app001-prod-use1-app"}) 
  }