resource "aws_network_interface" "app_instance_eni" {
  subnet_id       = data.aws_subnet.application_subnet.id
  private_ips     = [var.instance_ips[0]]
  security_groups = [aws_security_group.app_sg.id]
}

resource "aws_network_interface" "app_database_eni" {
  subnet_id       = data.aws_subnet.database_subnet.id
  private_ips     = [var.instance_ips[1]]
  security_groups = [aws_security_group.db_sg.id]
}
