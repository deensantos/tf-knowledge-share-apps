resource "aws_instance" "APP007-LAP01" {
  ami           = "ami-026b57f3c383c2eec"
  instance_type = "t2.medium"
  key_name      = "hands-on"
  root_block_device {
    volume_type = "gp3"
    volume_size = 20
    encrypted   = true
    kms_key_id  = data.aws_kms_key.Default_key.arn
  }
  network_interface {
    network_interface_id = aws_network_interface.App007-LAP01_network_int.id
    device_index         = 0
  }

  tags = merge(local.tags, {
    Name = "APP007-LAP01"
  })

  volume_tags = merge(local.tags, {
    Name = "APP007-LAP01-Volume"
  })
}

resource "aws_instance" "APP007-LAP02" {
  ami           = "ami-026b57f3c383c2eec"
  instance_type = "t2.medium"
  key_name      = "hands-on"
  root_block_device {
    volume_type = "gp3"
    volume_size = 20
    encrypted   = true
    kms_key_id  = data.aws_kms_key.Default_key.arn
  }
  network_interface {
    network_interface_id = aws_network_interface.App007-LAP02_network_int.id
    device_index         = 0
  }

  tags = merge(local.tags, {
    Name = "APP007-LAP02"
  })

  volume_tags = merge(local.tags, {
    Name = "APP007-LAP02-Volume"
  })
}

resource "aws_instance" "App007-WDP01" {
  ami           = "ami-026b57f3c383c2eec"
  instance_type = "t2.medium"
  key_name      = "hands-on"
  root_block_device {
    volume_type = "gp3"
    volume_size = 20
    encrypted   = true
    kms_key_id  = data.aws_kms_key.Default_key.arn
  }
  network_interface {
    network_interface_id = aws_network_interface.App007-WDP01_network_int.id
    device_index         = 0
  }

  tags = merge(local.tags, {
    Name = "APP007-WDP01"
  })

  volume_tags = merge(local.tags, {
    Name = "APP007-WDP01-Volume"
  })
}