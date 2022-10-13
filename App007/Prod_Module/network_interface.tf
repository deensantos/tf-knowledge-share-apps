resource "aws_network_interface" "App007-LAP01_network_int" {
  subnet_id       = data.aws_subnet.app_subnet_1.id
  private_ips     = [var.ip[0]]
  security_groups = [aws_security_group.app_sg.id]
}

resource "aws_network_interface" "App007-LAP02_network_int" {
  subnet_id       = data.aws_subnet.app_subnet_2.id
  private_ips     = [var.ip[1]]
  security_groups = [aws_security_group.app_sg.id]
}

resource "aws_network_interface" "App007-WDP01_network_int" {
  subnet_id       = data.aws_subnet.db_subnet_1.id
  private_ips     = [var.ip[2]]
  security_groups = [aws_security_group.db_sg.id]
}
