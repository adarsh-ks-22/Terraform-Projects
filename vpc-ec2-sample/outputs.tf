output "vpc_id" {
  value = module.networking.vpc_id
}

output "public_subnet_id" {
  value = module.networking.public_subnet_id
}

output "ec2_instance_id" {
  value = module.ec2.instance_id
}