resource "aws_ebs_volume" "App_Volume_1" {
  availability_zone = "us-east-1a"
  size              = 30

tags = merge({Name = "APP004-LAP01-Volume1"}, local.common_tags)

}

resource "aws_ebs_volume" "App_Volume_2" {
  availability_zone = "us-east-1b"
  size              = 30

tags = merge({Name = "APP004-LAP02-Volume1"}, local.common_tags)

}

resource "aws_volume_attachment" "ebs_att_volume1" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.App_Volume_1.id
  instance_id = aws_instance.APP004-LAP01.id
}

resource "aws_volume_attachment" "ebs_att_volume2" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.App_Volume_2.id
  instance_id = aws_instance.APP004-LAP02.id
}