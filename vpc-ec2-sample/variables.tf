variable "vpc_cidr_block" {
  type        = string
}

variable "public_subnet_cidr" {
  type        = string
}

variable "private_subnet_cidr" {
  type        = string
}

variable "availability_zone" {
  type        = string
}

variable "key_name" {
  type        = string
}

variable "public_key_path" {
  type        = string
}

variable "ami" {
  type        = string
}

variable "instance_type" {
  type        = string
}

variable "user_data" {
  type        = string
}