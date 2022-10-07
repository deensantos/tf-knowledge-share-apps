resource "aws_instance" "APP004-LAP01" {
  ami           = "ami-026b57f3c383c2eec"
  instance_type = var.instance_type
  key_name      = data.aws_key_pair.project_key.key_name

  network_interface {
    network_interface_id = aws_network_interface.instance_nic_app_a.id
    device_index         = 0
  }

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
    encrypted   = true
    kms_key_id  = data.aws_kms_key.customer_key.arn
  }

  tags = merge({ Name = "APP004-LAP01" }, local.common_tags)

}

resource "aws_network_interface" "instance_nic_app_a" {
  subnet_id       = data.aws_subnet.application_a_subnet.id
  private_ips     = ["10.0.1.100"]
  security_groups = [aws_security_group.app_sg.id]
}

############################################################
resource "aws_instance" "APP004-LAP02" {
  ami           = "ami-026b57f3c383c2eec"
  instance_type = var.instance_type
  key_name      = data.aws_key_pair.project_key.key_name

  network_interface {
    network_interface_id = aws_network_interface.instance_nic_app_b.id
    device_index         = 0
  }

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
    encrypted   = true
    kms_key_id  = data.aws_kms_key.customer_key.arn
  }

  tags = merge({ Name = "APP004-LAP02" }, local.common_tags)

}

resource "aws_network_interface" "instance_nic_app_b" {
  subnet_id       = data.aws_subnet.application_b_subnet.id
  private_ips     = ["10.0.2.100"]
  security_groups = [aws_security_group.app_sg.id]
}

############################################################
resource "aws_instance" "APP004-WDP01" {
  ami           = "ami-026b57f3c383c2eec"
  instance_type = "t2.large"
  key_name      = data.aws_key_pair.project_key.key_name

  network_interface {
    network_interface_id = aws_network_interface.database_nic.id
    device_index         = 0
  }

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
    encrypted   = true
    kms_key_id  = data.aws_kms_key.customer_key.arn
  }

  tags = merge({ Name = "APP004-WDP01" }, local.common_tags)

}

resource "aws_network_interface" "database_nic" {
  subnet_id       = data.aws_subnet.data_a_subnet.id
  private_ips     = ["10.0.3.100"]
  security_groups = [aws_security_group.database_sg.id]
}