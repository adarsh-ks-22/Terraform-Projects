resource "aws_key_pair" "ec2_key_pair" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

resource "aws_instance" "demo_server" {
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id       = var.subnet_id
  key_name        = var.key_name
  security_groups = [var.security_group_id]
  user_data       = var.user_data
  associate_public_ip_address = true

  tags = {
    Name = "Web-Server"
  }
}

