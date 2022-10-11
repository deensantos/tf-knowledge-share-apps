resource "aws_instance" "app_instance_01" {
  ami           = "ami-026b57f3c383c2eec"
  instance_type = "t2.medium"

  root_block_device {
    volume_size = "20"
    volume_type = "gp3"
    encrypted = "true"
    kms_key_id = data.aws_kms_key.default_key.arn
  }
  network_interface {
    network_interface_id = aws_network_interface.app_interface_01.id
    device_index = 0
  }
    tags = merge(local.common_tags,{Name = "APP006-LAP01"})
  
}