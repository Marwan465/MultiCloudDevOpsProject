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
  value = module.security-group.security_group_id
}
output "security_group_db_id" {
  value = module.security-group-db.security_group_id
}
output "ec2_instance_id" {
  value = module.ec2.instance_id
}
output "backend_instance_private_ip" {
  value = module.ec2["backend"].private_ip
}

output "frontend_instance_private_ip" {
  value = module.ec2["frontend"].private_ip
}
output "mysql_rds_endpoint" {
  description = "The endpoint of the MySQL RDS instance"
  value       = module.mysql_rds.rds_endpoint 
}

