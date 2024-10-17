variable "allocated_storage" {
  description = "The size of the RDS storage in GB"
  type        = number
}

variable "engine_version" {
  description = "The version of MySQL to use"
  type        = string
}

variable "instance_class" {
  description = "The class of the RDS instance (e.g., db.t2.micro)"
  type        = string
}

variable "db_name" {
  description = "The name of the database"
  type        = string
}

variable "username" {
  description = "The master username for the RDS instance"
  type        = string
}

variable "password" {
  description = "The master password for the RDS instance"
  type        = string
}

variable "publicly_accessible" {
  description = "Whether the instance is publicly accessible"
  type        = bool
}

variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs to associate with the RDS instance"
  type        = list(string)
}
