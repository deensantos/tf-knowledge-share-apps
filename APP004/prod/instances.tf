resource "aws_instance" "APP004-LAP01" {
  ami = "ami-026b57f3c383c2eec"
  #   ami           = "ami-00aaafade66bcd2bb"
  instance_type = "t2.medium"
  key_name      = data.aws_key_pair.ec2_keypair.key_name

  network_interface {
    network_interface_id = aws_network_interface.instance_nic_app_a.id
    device_index         = 0
  }

  tags = merge({ Name = "APP004-LAP01" }, local.common_tags)

  #ami has httpd installed and uses root and additional vols
  root_block_device {
    volume_size = 40
    volume_type = "gp3"
    encrypted   = true
    kms_key_id  = data.aws_kms_key.customer_key.arn
  }

  # user_data = file("install-httpd.sh")

}

resource "aws_instance" "APP004-LAP02" {
  ami = "ami-026b57f3c383c2eec"
  #   ami           = "ami-00aaafade66bcd2bb"
  instance_type = "t2.medium"
  key_name      = data.aws_key_pair.ec2_keypair.key_name

  network_interface {
    network_interface_id = aws_network_interface.instance_nic_app_b.id
    device_index         = 0
  }

  tags = {
    Name = "APP004-LAP02",
    ManagedBy = "Yes"
    app_id = "APP004",
    environment = "Prod"
  }
  
  root_block_device {
    volume_size = 20
    volume_type = "gp3"
    encrypted   = true
    kms_key_id  = data.aws_kms_key.customer_key.arn
  }

  # user_data = file("install-httpd.sh")
}

resource "aws_instance" "APP004-WDP01" {
  ami           = "ami-026b57f3c383c2eec"
  instance_type = "t2.large"
  key_name      = data.aws_key_pair.ec2_keypair.key_name

  network_interface {
    network_interface_id = aws_network_interface.instance_nic_db.id
    device_index         = 0
  }

  tags = merge({ Name = "APP004-WDP01" }, local.common_tags)

  root_block_device {
    volume_size = 30
    volume_type = "gp3"
    encrypted   = true
    kms_key_id  = data.aws_kms_key.customer_key.arn
  }

}