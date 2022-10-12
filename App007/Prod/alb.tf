resource "aws_lb" "app007-alb-prod" {
  name               = "app007-alb-prod"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]
  subnets            = [data.aws_subnet.app07_subnet_lb_a.id, data.aws_subnet.app07_subnet_lb_b.id]

tags = merge(local.tags, {
    Name = "app007-alb-prod"
    }
  )
}

resource "aws_lb_target_group" "App007-lb-tg-front-end" {
  name     = "App007-lb-tg-front-end"
  target_type = "instance"
  port     = 443
  protocol = "HTTPS"
  vpc_id   = data.aws_vpc.app07_vpc.id
}

resource "aws_lb_listener" "App007-front-end" {
  load_balancer_arn = aws_lb.app007-alb-prod.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.App007-lb-tg-front-end.arn
  }
}

resource "aws_lb_target_group_attachment" "App07-tg-attachment-1" {
  target_group_arn = aws_lb_target_group.App007-lb-tg-front-end.arn
  target_id        = aws_instance.APP007-LAP01.id
  port             = 443
}

resource "aws_lb_target_group_attachment" "App07-tg-attachment-2" {
  target_group_arn = aws_lb_target_group.App007-lb-tg-front-end.arn
  target_id        = aws_instance.APP007-LAP02.id
  port             = 443
}
