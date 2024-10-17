
variable "access_key" {
  description = "IAM acess key"
 
}

variable "secret_key" {
  description = "IAM secret key"
  
}
 variable "region" {
   description = "aws region"
   default     = "us-east-1"
 }

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  default     = "10.0.2.0/24"
}
 
variable "ami" {                               // Amazon Machine Image
  description = "ID of the AMI"
  default     = "ami-09d3b3274b6c5d4aa"  # ami-xxxxxxxxxxxxxxxxx Replace with your valid AMI ID 09d3b3274b6c5d4aa for ubuntu 22.04
}

variable "instance_type" {
  description = "Type of EC2 instance"
  default     = "t2.micro"   //to provide another value please use terraform apply -var="instance_type=t3.micro"
}

variable "key_name" {
  description = "Name of the EC2 key pair"
  default     = "your-key-pair-name"  # Replace with your key pair name
}

variable "user_data" {
  description = "User data script for EC2 instance"
  default     = ""
}

variable "instances" {
  description = "Map of instances with their corresponding names and tags"
  type = map(object({
    name = string
    tags = map(string)
  }))
  default = {
    "backend" = {
      name = "backend-machine"
      tags = {
        Environment = "production"
        Team        = "backend"
      }
    }
    "frontend" = {
      name = "frontend-machine"
      tags = {
        Environment = "production"
        Team        = "frontend"
      }
    }
  }
}
variable "root_volume_size" {
  description = "Size of the root volume (GB)"
  type        = number
  default     = 8
}


variable "rds_config" {
  description = "Configuration for the MySQL RDS instance"
  type = object({
    allocated_storage   = number
    engine_version      = string
    instance_class      = string
    db_name             = string
    username            = string
    password            = string
    publicly_accessible = bool
    security_group_ids  = list(string)
  })
  default = {
    allocated_storage   = 20
    engine_version      = "8.0"
    instance_class      = "db.t2.micro"
    db_name             = "mydb"
    username            = "admin"
    password            = "adminpassword"
    publicly_accessible = false
  }
}