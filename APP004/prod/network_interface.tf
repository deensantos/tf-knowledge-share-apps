resource "aws_network_interface" "instance_nic_app_a" {
  subnet_id       = data.aws_subnet.application_a_subnet.id
  private_ips     = ["10.0.1.100"]
  security_groups = [aws_security_group.app_sg.id]
}

resource "aws_network_interface" "instance_nic_app_b" {
  subnet_id       = data.aws_subnet.application_b_subnet.id
  private_ips     = ["10.0.2.100"]
  security_groups = [aws_security_group.app_sg.id]
}

resource "aws_network_interface" "instance_nic_db" {
  subnet_id       = data.aws_subnet.db_subnet.id
  private_ips     = ["10.0.3.100"]
  security_groups = [aws_security_group.database_sg.id]
}