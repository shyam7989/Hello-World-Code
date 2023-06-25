variable "aws_region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.20.0.0/16"
}

variable "public_subnets_cidr" {
  default = "10.20.1.0/26"
}

variable "private_subnets_cidr" {
  default = "10.20.3.0/26"
}

variable "azs" {
  default = "us-east-2a"
}
