
resource "aws_security_group" "app_security_group" {
  name        = "app002-prod-use1-app"
  description = "App security for APP002"
  vpc_id      = data.aws_vpc.mainVPC.id

  ingress {
    description      = "Ingress traffic from ALB"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Department = "IT",
    Name = "sg-app002-prod-use1-app",
    AppID = "APP002",
    Env = "Prod"
  }

  
}