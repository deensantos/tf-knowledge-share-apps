resource "aws_instance" "APP004-LAP01" {
  ami           = "ami-026b57f3c383c2eec"
  instance_type = "t2.medium"

  network_interface {
    network_interface_id = aws_network_interface.instance_nic_app_a.id
    device_index         = 0
  }

tags = merge({Name = "APP004-LAP01"}, local.common_tags)

root_block_device {
  volume_size = 20
  volume_type = "gp3"
  encrypted = true
  kms_key_id = data.aws_kms_key.customer_key.arn
}

}

resource "aws_instance" "APP004-LAP02" {
  ami           = "ami-026b57f3c383c2eec"
  instance_type = "t2.medium"

  network_interface {
    network_interface_id = aws_network_interface.instance_nic_app_b.id
    device_index         = 0
  }

tags = merge({Name = "APP004-LAP02"}, local.common_tags)

root_block_device {
  volume_size = 20
  volume_type = "gp3"
  encrypted = true
  kms_key_id = data.aws_kms_key.customer_key.arn
}

}