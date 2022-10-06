resource "aws_network_interface" "app_instance_eni" {
  subnet_id       = data.aws_subnet.application_subnet.id
  private_ips     = ["10.0.1.10"]
  security_groups = [aws_security_group.app_sg.id]
}
