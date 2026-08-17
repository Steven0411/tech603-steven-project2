resource "aws_security_group" "app_group" {
  name = "tech603-steven-tf-allow-port-22-3000-80"
  vpc_id = aws_vpc.custom_vpc.id
  
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["${chomp(data.http.my_public_ip.response_body)}/32"]
  }
  ingress {
    from_port = 3000
    to_port = 3000
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 27017
    to_port = 27017
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "db_group" {
  name = "tech603-steven-tf-allow-port-22-27017"
  vpc_id = aws_vpc.custom_vpc.id

  ingress {
    from_port = 27017
    to_port = 27017
    protocol = "tcp"
    security_groups = [ aws_security_group.app_group.id ]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["${chomp(data.http.my_public_ip.response_body)}/32"]
  }
}