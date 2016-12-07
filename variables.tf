variable "aws_account" {}

variable "aws_region" {}

variable "environment_name" {}

variable "hostname" {}

variable "image_id" {}

variable "vpc_name" {}

variable "associate_public_ip_address" {
  default = true
}

variable "instance_type" {
  default = "t2.micro"
}

variable "ssh_port" {
  default = "22"
}
