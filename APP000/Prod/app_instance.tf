resource "aws_instance" "APP001LAP01" {
  ami               = "ami-026b57f3c383c2eec"
  instance_type     = "t2.medium"
  availability_zone = "us-east-1a"
  key_name = "hands-on"

  network_interface {
    network_interface_id = aws_network_interface.app_network_interface_01.id
    device_index         = 0
  }

  root_block_device {

    encrypted   = true
    kms_key_id  = data.aws_kms_key.kms_key.arn
    volume_size = 30
    volume_type = "gp3"

  }

  volume_tags = merge(
    local.tags,
    { Name = "APP001LAP01-vol" }
  )

  tags = merge(
    local.tags,
    { Name = "APP001LAP01" }
  )

}


