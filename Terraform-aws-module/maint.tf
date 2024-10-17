provider "aws" {
 access_key = var.access_key
 secret_key = var.secret_key
 region = var.region 
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr_block = var.vpc_cidr_block
   
}

module "public-subnet" {
  source = "./modules/public-subnet"
  vpc_id   = module.vpc.vpc_id
  public_subnet_cidr   = var.public_subnet_cidr
}

module "private-subnet" {
  source = "./modules/private-subnet"
  vpc_id   = module.vpc.vpc_id
  private_subnet_cidr  = var.private_subnet_cidr
}

module "security-group" {
  source   = "./modules/security-group"
  vpc_id   = module.vpc.vpc_id
}
module "security-group-db" {
  source   = "./modules/security-group"
  vpc_id   = module.vpc.vpc_id
  backend_instance_private_ip     = module.ec2["backend"].private_ip
}

module "ec2" {
  source              = "./modules/ec2"
  for_each            = var.instances
  subnet_id           = module.public-subnet.public_subnet_id
  security_group_id   = module.security-group.security_group_id
  ami                 = var.ami  
  instance_type       = var.instance_type
  key_name            = var.key_name     
  user_data           = var.user_data 
  root_volume_size    = var.root_volume_size
  instance_name       = each.value.name
  instance_tags       = each.value.tags
  public_ip           = true     
}

# MySQL RDS instance module
module "mysql_rds" {
  source                 = "./modules/mysql_rds"
  allocated_storage      = var.rds_config.allocated_storage
  engine_version         = var.rds_config.engine_version
  instance_class         = var.rds_config.instance_class
  db_name                = var.rds_config.db_name
  username               = var.rds_config.username
  password               = var.rds_config.password
  publicly_accessible    = var.rds_config.publicly_accessible
  security_group_id      = module.security-group-db.security_group_id
}
