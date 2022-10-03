resource "aws_network_interface" "network_interface_1" {
  subnet_id       = data.aws_subnet.data_subnet_1.id
  private_ips     = ["10.0.3.10"]
#   security_groups = [aws_security_group.web.id]

}