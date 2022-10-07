resource "aws_instance" "app003-instance1" {
  ami           = "ami-026b57f3c383c2eec"
  instance_type = "t2.large"


  root_block_device {
    volume_size = 50
    volume_type = "gp3"
    encrypted   = true
    kms_key_id  = data.aws_kms_key.customer_key.arn
  }

  network_interface {
    network_interface_id = aws_network_interface.app_instance_eni.id
    device_index         = 0
  }
  tags = merge(local.tags, {
    Name = "APP003-LAP01"
  })
}

resource "aws_ebs_volume" "extra_volume_app" {
  availability_zone = data.aws_subnet.application_subnet.availability_zone
  size              = 10

  tags = {
    Name = "extra-volume-app"
  }
}

resource "aws_volume_attachment" "ebs_attachment_app" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.extra_volume_app.id
  instance_id = aws_instance.app003-instance1.id
}

resource "aws_instance" "APP003-WDP01" {
  ami           = "ami-026b57f3c383c2eec"
  instance_type = "t2.large"


  root_block_device {
    volume_size = 30
    volume_type = "gp3"
    encrypted   = true
    kms_key_id  = data.aws_kms_key.customer_key.arn
  }

  network_interface {
    network_interface_id = aws_network_interface.app_database_eni.id
    device_index         = 0
  }
  tags = {
    Name = "APP003-WDP01",
    DBA = "Support",
    Department = "IT",
    APPID = "APP003"
  }
}
