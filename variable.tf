variable "region" {
  default = "eu-west-1"
}

variable "app_ami" {
  default = "ami-02d59ec0bfae5cbe7"
}

variable "db_ami" {
  default = "ami-01562c9244d3a1698"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "public_key" {
  default = "tech603-steven-aws-key"
}