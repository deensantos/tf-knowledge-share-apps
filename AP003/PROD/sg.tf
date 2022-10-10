resource "aws_security_group" "db_sg" {
  name        = "${var.app_id}-${var.environment}-${local.region}-db"
  description = "Allow DB traffic"
  vpc_id      = data.aws_vpc.main_vpc.id

  ingress {
    description      = "DB Access"
    from_port        = 1433
    to_port          = 1433
    protocol         = "tcp"
    security_groups = [aws_security_group.app_sg.id]
  }

  tags = merge(local.tags, {
    Name = "${var.app_id}-${var.environment}-${local.region}-db"
  })
}

resource "aws_security_group" "app_sg" {
  name        = "${var.app_id}-${var.environment}-${local.region}-app"
  description = "Allow APP traffic"
  vpc_id      = data.aws_vpc.main_vpc.id

  ingress {
    description      = "APP Access"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

  tags = merge(local.tags, {
    Name = "${var.app_id}-${var.environment}-${local.region}-app"
  })
}


resource "aws_security_group" "alb_sg" {
  name        = "${var.app_id}-${var.environment}-${local.region}-alb"
  description = "Allow ALB traffic"
  vpc_id      = data.aws_vpc.main_vpc.id

  ingress {
    description      = "ALB Access"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = merge(local.tags, {
    Name = "${var.app_id}-${var.environment}-${local.region}-alb"
  })
}
