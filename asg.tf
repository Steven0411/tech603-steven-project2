resource "aws_launch_template" "app-lt" {
  name = "tech603-steven-app-lt"

  image_id = var.app_ami
  instance_type = var.instance_type
  key_name = var.public_key

  network_interfaces {
    associate_public_ip_address = true
    security_groups = [ aws_security_group.app_group.id ]
  }

  user_data = base64encode(
    templatefile("user_data.tftpl", {
      db_ip = aws_instance.db_instance.private_ip
    })
  )

  tag_specifications {
    resource_type = "instance"

    tags = {
        Name = "tech603-steven-app"
    }    
  }

}


resource "aws_autoscaling_group" "asg" {
  name = "tech603-steven-tf-asg"
  min_size = 2
  max_size = 3
  vpc_zone_identifier = [ aws_subnet.public_subnet.id ]
  launch_template {
    id = aws_launch_template.app-lt.id
    version = "$Latest"
  }
}