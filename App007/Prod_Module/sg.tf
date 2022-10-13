resource "aws_security_group" "app_sg" {
  name        = "${var.app_id}-${var.env}-${local.region}-app"
  description = "Application Traffic for ${var.app_id}"
  vpc_id      = coalesce(var.vpc_id, data.aws_vpc.app07_vpc.id)

  ingress {
    description = "Tarrfic from LB to ${var.app_id}"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    security_groups = [aws_security_group.lb_sg.id]
  }

  tags = merge(local.tags, {
    Name = "${var.app_id}-${var.env}-${local.region}-app"
    }
  )
}

resource "aws_security_group" "db_sg" {
  name        = "${var.app_id}-${var.env}-${local.region}-db"
  description = "Database Traffic for ${var.app_id}"
  vpc_id      = data.aws_vpc.app07_vpc.id

  ingress {
    description = "Tarrfic from App to DB"
    from_port   = 1433
    to_port     = 1433
    protocol    = "tcp"
    security_groups = [aws_security_group.app_sg.id]
  }

  ingress {
    description = "Jump Box Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.3.150/32"]
  }

  tags = merge(local.tags, {
    Name = "${var.app_id}-${var.env}-${local.region}-db"
    }
  )

}

resource "aws_security_group" "lb_sg" {
  name        = "${var.app_id}-${var.env}-${local.region}-lb"
  description = "LB Traffic"
  vpc_id      = data.aws_vpc.app07_vpc.id

  ingress {
    description = "LB Tarrfic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "HTTPS Traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(local.tags, {
    Name = "${var.app_id}-${var.env}-${local.region}-lb"
    }
  )

}
