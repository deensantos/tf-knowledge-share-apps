resource "aws_lb" "alb_front_end" {
  name               = "app004-alb-prod"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [data.aws_subnet.public_a.id, data.aws_subnet.public_b.id]

  tags = merge({ Name = "app004-alb-prod" }, local.common_tags)
}

resource "aws_lb_listener" "alb_front_end" {
  load_balancer_arn = aws_lb.alb_front_end.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.backend.arn
  }

  tags = merge({ Name = "app004-alb-prod-listener" }, local.common_tags)
}

resource "aws_lb_target_group" "backend" {
  name        = "app04-instance-tg"
  port        = 443
  protocol    = "HTTPS"
  target_type = "instance"
  vpc_id      = data.aws_vpc.vpc.id
}

resource "aws_lb_target_group_attachment" "LAP01_target_grp_attatchment" {
  target_group_arn = aws_lb_target_group.backend.arn
  target_id        = aws_instance.APP004-LAP01.id
  port             = 443
}

resource "aws_lb_target_group_attachment" "LAP02_target_grp_attatchment" {
  target_group_arn = aws_lb_target_group.backend.arn
  target_id        = aws_instance.APP004-LAP02.id
  port             = 443
}

