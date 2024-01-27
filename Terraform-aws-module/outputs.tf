output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_id" {
  value = module.public-subnet.public_subnet_id
}

output "private_subnet_id" {
  value = module.private-subnet.private_subnet_id
}

output "security_group_id" {
  value = module.security_group.security_group_id
}

output "ec2_instance_id" {
  value = module.ec2.instance_id
}
