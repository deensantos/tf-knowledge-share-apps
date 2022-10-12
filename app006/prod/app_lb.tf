resource "aws_lb" "app006-alb-prod" {
  name               = "app006-alb-prod"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = [data.aws_subnet.alb_prod_pub_subnet_a.id, data.aws_subnet.alb_prod_pub_subnet_b.id]

tags = merge(local.common_tags,{Name = "app006-alb-prod"})

}