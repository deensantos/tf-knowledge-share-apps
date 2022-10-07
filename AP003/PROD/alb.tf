resource "aws_lb" "app003-alb-prod" {
  name               = "app003-alb-prod"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [data.aws_subnet.public_subnet_a.id, data.aws_subnet.public_subnet_b.id]

  tags = {
    Environment = "production",
    Alb = "Public"
  }
}

resource "aws_lb_target_group" "app003_target_group" {
  name     = "app003-target-group"
  port     = 443
  protocol = "HTTPS"
  vpc_id   = data.aws_vpc.main_vpc.id
}

resource "aws_lb_target_group_attachment" "app003_tg_attachment" {
  target_group_arn = aws_lb_target_group.app003_target_group.arn
  target_id        = aws_instance.app003-instance1.id
  port             = 443
}

resource "aws_lb_listener" "app003_port_80" {
  load_balancer_arn = aws_lb.app003-alb-prod.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app003_target_group.arn
  }
}
