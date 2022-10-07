output "app_load_balancer_" {
  value = aws_lb.alb_front_end.dns_name
  description = "dns name to access app loadbalancer"
}
