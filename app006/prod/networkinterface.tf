resource "aws_network_interface" "app_interface_01" {
  subnet_id       = data.aws_subnet.app_subnet.id
  private_ips     = ["10.0.1.50"]
  security_groups = [aws_security_group.app_sg.id]
  }