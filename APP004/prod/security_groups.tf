resource "aws_security_group" "app_sg" {
  name        = lower("${var.app_id}-${var.env}-${local.region}-app")
  description = "App Instance traffic"
  vpc_id      = data.aws_vpc.vpc.id

  # ingress {
  #   description     = "Allow https traffic"
  #   from_port       = 443
  #   to_port         = 443
  #   protocol        = "tcp"
  #   security_groups = [aws_security_group.alb_sg.id]
  # }

  ingress {
    description     = "Allow http traffic"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb_sg.id]
  }

  ############## To be removed ################
  ingress {
    description = "Allow ssh from my pC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["97.108.231.162/32"]
  }

  ingress {
    description = "Allow ssh from my internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Jump Server Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.jump_server_ip
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 1443
    to_port     = 1443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge({ Name = lower("${var.app_id}-${var.env}-${local.region}-app")}, local.common_tags)
}

resource "aws_security_group" "alb_sg" {
  name        =  lower("${var.app_id}-${var.env}-${local.region}-alb")  
  description = "Traffic to ALB"
  vpc_id      = data.aws_vpc.vpc.id

  ingress {
    description = "Allow http traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # egress {
  #   from_port = 443
  #   to_port   = 443
  #   protocol  = "tcp"
  #   # security_groups = [aws_security_group.app_sg.id]
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  egress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["10.0.0.0/16","0.0.0.0/0"]
  }

  tags = merge({ Name = lower("${var.app_id}-${var.env}-${local.region}-alb") }, local.common_tags)
}

resource "aws_security_group" "database_sg" {
  name        =  lower("${var.app_id}-${var.env}-${local.region}-db")  
  description = "traffic to database"
  vpc_id      = data.aws_vpc.vpc.id

  ingress {
    description     = "Allow traffic to database"
    from_port       = 1433
    to_port         = 1433
    protocol        = "tcp"
    security_groups = [aws_security_group.app_sg.id]
  }

  tags = merge({ Name = lower("${var.app_id}-${var.env}-${local.region}-db")}, local.common_tags)
}

resource "aws_security_group_rule" "alb_egress_rule" {
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = [data.aws_vpc.vpc.cidr_block]
  security_group_id = aws_security_group.alb_sg.id
}

# resource "aws_security_group_rule" "alb_egress_rule" {
#   type              = "egress"
#   from_port         = 80
#   to_port           = 80
#   protocol          = "tcp"
#   cidr_blocks       = [data.aws_vpc.vpc.cidr_block]
#   security_group_id = aws_security_group.alb_sg.id
# }