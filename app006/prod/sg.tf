resource "aws_security_group" "app_sg" {
    name        = "app006-prod-use1-app"
    description = "Allow traffic to application"
    vpc_id      = data.aws_vpc.default_vpc.id

  ingress {
    description      = "Access from LB"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    
    security_groups = [aws_security_group.alb_sg.id]
  }

  tags = merge(local.common_tags,{Name = "sg-app006-prod-use1-app"}) 
  }


  resource "aws_security_group" "db_sg" {
    name        = "app006-prod-use1-db"
    description = "Allow traffic to database"
    vpc_id      = data.aws_vpc.default_vpc.id

  ingress {
    description      = "Access from LB"
    from_port        = 1433
    to_port          = 1433
    protocol         = "tcp"
    security_groups = [aws_security_group.app_sg.id]
  }

  tags = merge(local.common_tags,{Name = "sg-app006-prod-use1-db"}) 
  }


  resource "aws_security_group" "alb_sg" {
    name        = "app006-prod-use1-alb"
    description = "Allow traffic to load balancer"
    vpc_id      = data.aws_vpc.default_vpc.id

  ingress {
    description      = "Access from LB"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
    # security_groups = []
  }

  tags = merge(local.common_tags,{Name = "sg-app006-prod-use1-alb"}) 
  }