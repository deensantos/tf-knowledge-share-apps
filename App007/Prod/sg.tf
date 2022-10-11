resource "aws_security_group" "app_sg" {
  name        = "app007-prod-use1-app"
  description = "Application Traffic for App007"
  vpc_id      = data.aws_vpc.app07_vpc.id

  ingress {
    description = "Tarrfic from LB to App007"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    security_groups = [aws_security_group.lb_sg.id]
  }

  tags = merge(local.tags, {
    Name = "app007-prod-use1-app"
    }
  )
}

resource "aws_security_group" "db_sg" {
  name        = "app007-prod-use1-db"
  description = "Database Traffic for App007"
  vpc_id      = data.aws_vpc.app07_vpc.id

  ingress {
    description = "Tarrfic from App to DB"
    from_port   = 1433
    to_port     = 1433
    protocol    = "tcp"
    security_groups = [aws_security_group.app_sg.id]
  }

  tags = merge(local.tags, {
    Name = "app007-prod-use1-db"
    }
  )
}

resource "aws_security_group" "lb_sg" {
  name        = "app007-prod-use1-lb"
  description = "LB Traffic"
  vpc_id      = data.aws_vpc.app07_vpc.id

  ingress {
    description = "LB Tarrfic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.tags, {
    Name = "app007-prod-use1-lb"
    }
  )
}
