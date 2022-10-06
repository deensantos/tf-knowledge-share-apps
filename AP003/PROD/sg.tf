resource "aws_security_group" "db_sg" {
  name        = "app001-prod-use1-db"
  description = "Allow DB traffic"
  vpc_id      = data.aws_vpc.main_vpc.id

  ingress {
    description      = "DB Access"
    from_port        = 1433
    to_port          = 1433
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = merge(local.tags, {
    Name = "app001-prod-use1-db"
  })
}
