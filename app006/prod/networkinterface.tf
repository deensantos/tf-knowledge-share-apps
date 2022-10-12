resource "aws_network_interface" "app_interface_01" {
  subnet_id       = data.aws_subnet.app_subnet.id
  private_ips     = ["10.0.1.50"]
  security_groups = [aws_security_group.app_sg.id]
  }

resource "aws_network_interface" "app_interface_02" {
  subnet_id       = data.aws_subnet.app_subnet_b.id
  private_ips     = ["10.0.2.50"]
  security_groups = [aws_security_group.app_sg.id]
  }

resource "aws_network_interface" "db_interface_01" {
  subnet_id       = data.aws_subnet.db_subnet_a.id
  private_ips     = ["10.0.3.40"]
  security_groups = [aws_security_group.db_sg.id]
  }