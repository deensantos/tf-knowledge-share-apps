# #CREATE NETWORK INTERFACE for each domain controllers
resource "aws_network_interface" "app_network_interface_01" {
  subnet_id   = data.aws_subnet.app_subnet.id
  private_ips = ["10.0.1.100"]
  security_groups = [
    data.aws_security_group.global_sg.id,
    aws_security_group.app_sg.id
  ]

tags = merge(local.tags,{Name = "app000-nic01"})
}
