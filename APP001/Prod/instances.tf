# resource "aws_instance" "db-instance" {
#   ami           = "ami-026b57f3c383c2eec"
#   instance_type = "t2.large"
#   availability_zone = "us-east-1a"

#   key_name = "hands-on"

#   tags = {
#     Name = "APP001-WDP01"
#   }
# }