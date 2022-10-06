resource "aws_security_group" "app_sg" {
  name        = "app004-prod-use1-app"
  description = "App Instance traffic"
  vpc_id      = data.aws_vpc.vpc.id 

  ingress {
    description      = "Allow https traffic"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    security_groups      = [aws_security_group.alb_sg.id]
  }

  tags = merge({Name = "app004-prod-use1-app"}, local.common_tags)
}

resource "aws_security_group" "alb_sg" {
  name        = "app004-prod-use1-alb"
  description = "Traffic to ALB"
  vpc_id      = data.aws_vpc.vpc.id 

  ingress {
    description      = "Allow http traffic"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    # security_groups = [aws_security_group.app_sg.id]
    cidr_blocks = ["0.0.0.0/0"]
  }
#
  tags = merge({ Name = "app004-prod-use1-alb" }, local.common_tags)
}

resource "aws_security_group" "database_sg" {
  name        = "app004-prod-use1-db"
  description = "traffic to database"
  vpc_id      = data.aws_vpc.vpc.id 

  ingress {
    description      = "Allow traffic to database"
    from_port        = 1433
    to_port          = 1433
    protocol         = "tcp"
    security_groups = [aws_security_group.app_sg.id]
  }

  tags = merge({ Name = "app004-prod-use1-db" }, local.common_tags)
}