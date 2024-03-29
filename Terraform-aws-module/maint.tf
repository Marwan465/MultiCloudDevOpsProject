provider "aws" {
  # access_key = var.access_key
  # secret_key = var.secret_key
 // region = var.region 
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

module "security_group" {
  source   = "./modules/security-group"
  vpc_id   = module.vpc.vpc_id
}

module "ec2" {
  source              = "./modules/ec2"
  subnet_id           = module.public-subnet.public_subnet_id
  security_group_id   = module.security_group.security_group_id
  ami                 = var.ami  
  instance_type       = var.instance_type
  key_name            = var.key_name     
  user_data           = var.user_data      
}
