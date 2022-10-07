resource "aws_lb" "alb_prod" {
  name               = "app004-alb-prod"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [data.aws_subnet.alb_subnet_a.id, data.aws_subnet.alb_subnet_b.id]

  tags = local.common_tags
}


# resource "aws_lb_target_group" "alb_target_group" {
#   name     = "alb-target-group"
#   port     = 443
#   protocol = "HTTPS"
#   vpc_id   = data.aws_vpc.vpc.id
# }

resource "aws_lb_target_group" "alb_target_group" {
  name     = "alb-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.vpc.id
}

resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.alb_prod.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }
}

# resource "aws_lb_target_group_attachment" "tg_attachment_APP004-LAP01" {
#   target_group_arn = aws_lb_target_group.alb_target_group.arn
#   target_id        = aws_instance.APP004-LAP01.id
#   port             = 443
# }

resource "aws_lb_target_group_attachment" "tg_attachment_APP004-LAP01" {
  target_group_arn = aws_lb_target_group.alb_target_group.arn
  target_id        = aws_instance.APP004-LAP01.id
  port             = 80
}

# resource "aws_lb_target_group_attachment" "tg_attachment_APP004-LAP02" {
#   target_group_arn = aws_lb_target_group.alb_target_group.arn
#   target_id        = aws_instance.APP004-LAP02.id
#   port             = 443
# }

resource "aws_lb_target_group_attachment" "tg_attachment_APP004-LAP02" {
  target_group_arn = aws_lb_target_group.alb_target_group.arn
  target_id        = aws_instance.APP004-LAP02.id
  port             = 80
}