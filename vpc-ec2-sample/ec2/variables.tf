variable "vpc_id" {
  type        = string
}

variable "subnet_id" {
  type        = string
}

variable "ami" {
  type        = string
}

variable "instance_type" {
  type        = string
}

variable "key_name" {
  type        = string
}

variable "public_key_path" {
  type        = string
}

variable "user_data" {
  type        = string
}
variable "security_group_id" {
  type        = string
}