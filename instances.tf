provider "aws" {
  region = var.region
}

# resource "aws_instance" "app_instance" {
#   ami = var.app_ami

#   instance_type = var.instance_type
#   key_name = var.public_key

#   associate_public_ip_address = true
#   subnet_id = aws_subnet.public_subnet.id

#   vpc_security_group_ids = [aws_security_group.app_group.id]

#   user_data = templatefile("user_data.tftpl", {db_ip = aws_instance.db_instance.private_ip})

#   tags = {
#     Name = "tech603-steven-tf-app"
#   }
# }

data "aws_subnet" "default"{
  default_for_az = true
  availability_zone = "eu-west-1a"
}

data "http" "my_public_ip"{
  url = "https://ifconfig.me/ip"
}

resource "aws_instance" "db_instance" {
  ami = var.db_ami

  instance_type = var.instance_type
  key_name = var.public_key

  associate_public_ip_address = false
  subnet_id = aws_subnet.private_subnet.id

  vpc_security_group_ids = [aws_security_group.db_group.id]

  tags = {
      Name = "tech603-steven-tf-db"
  }
}