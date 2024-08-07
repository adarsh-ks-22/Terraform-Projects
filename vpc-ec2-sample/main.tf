provider "aws" {
  region = "us-east-1"
}

module "networking" {
  source = "./vpc"

  vpc_cidr_block      = var.vpc_cidr_block
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone   = var.availability_zone
}

module "ec2" {
  source = "./ec2"

  vpc_id        = module.networking.vpc_id
  subnet_id     = module.networking.public_subnet_id
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  public_key_path = var.public_key_path
  security_group_id = module.networking.security_group_id
  user_data     = var.user_data
}
