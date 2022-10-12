resource "aws_lb" "app006-alb-prod" {
  name               = "app006-alb-prod"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [data.aws_subnet.alb_prod_pub_subnet_a.id, data.aws_subnet.alb_prod_pub_subnet_b.id]

tags = merge(local.common_tags,{Name = "app006-alb-prod"})

}

resource "aws_lb_listener" "app06-alb-front_end" {
  load_balancer_arn = aws_lb.app006-alb-prod.arn
  port              = "80"
  protocol          = "HTTP"
  

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app06-alb-target-group.arn
  }
}
resource "aws_lb_target_group" "app06-alb-target-group" {
  name     = "app06-alb-target-group"
  port     = 443
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.default_vpc.id
}
resource "aws_lb_target_group_attachment" "app01_target_group" {
  target_group_arn = aws_lb_target_group.app06-alb-target-group.arn
  target_id        = aws_instance.app_instance_01.id 
  port             = 443
}
resource "aws_lb_target_group_attachment" "app02_target_group" {
  target_group_arn = aws_lb_target_group.app06-alb-target-group.arn
  target_id        = aws_instance.app_instance_02.id
  port             = 443
}