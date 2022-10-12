resource "aws_network_interface" "App007-LAP01_network_int" {
  subnet_id       = data.aws_subnet.app07_subnet_a.id
  private_ips     = ["10.0.1.13"]
  security_groups = [aws_security_group.app_sg.id]
}

resource "aws_network_interface" "App007-LAP02_network_int" {
  subnet_id       = data.aws_subnet.app07_subnet_b.id
  private_ips     = ["10.0.2.13"]
  security_groups = [aws_security_group.app_sg.id, "sg-02e56ad735c415467"]
}

resource "aws_network_interface" "App007-WDP01_network_int" {
  subnet_id       = data.aws_subnet.app07_subnet_db_a.id
  private_ips     = ["10.0.3.13"]
  security_groups = [aws_security_group.db_sg.id, "sg-02e56ad735c415467"]

}