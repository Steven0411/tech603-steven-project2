resource "aws_vpc" "custom_vpc" {
  cidr_block = "10.0.0.0/16"

  region = var.region

  tags = {
    Name = "tech603-steven-tf-vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.custom_vpc.id

  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = true

  tags = {
    Name = "tech603-steven-public-subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.custom_vpc.id

  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "tech603-steven-private-subnet"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.custom_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.custom_internet_gateway.id
  }

  tags = {
    Name = "tech603-steven-rt"
  }
}

resource "aws_internet_gateway" "custom_internet_gateway" {
  vpc_id = aws_vpc.custom_vpc.id

  tags = {
    Name = "tech603-steven-ig"
  }
}

resource "aws_route_table_association" "web" {
  route_table_id = aws_route_table.public_rt.id
  subnet_id = aws_subnet.public_subnet.id
}