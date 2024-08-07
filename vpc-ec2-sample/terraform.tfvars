vpc_cidr_block      = "10.0.0.0/16"
public_subnet_cidr  = "10.0.1.0/24"
private_subnet_cidr = "10.0.2.0/24"
availability_zone   = "us-east-1a"
key_name            = "logan-keypair"
public_key_path     = "/home/aws_support/.ssh/id_rsa.pub"
ami                 = "ami-04a81a99f5ec58529"
instance_type       = "t2.micro"
user_data           = <<EOF
#!/bin/bash
sudo apt update
sudo apt install -y apache2
sudo cat <<HTML > /var/www/html/index.html
<!DOCTYPE html>
<html><body><h1>Welcome to my website</h1></body></html>
HTML
sudo systemctl restart apache2
EOF
