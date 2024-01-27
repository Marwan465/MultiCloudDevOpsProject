variable "ami" {
  description = "ID of the AMI"
}

variable "instance_type" {
  description = "Type of EC2 instance"
}

variable "subnet_id" {
  description = "ID of the subnet"
}

variable "key_name" {
  description = "Name of the EC2 key pair"
}

variable "security_group_id" {
  description = "ID of the security group"
}

variable "user_data" {
  description = "User data script for EC2 instance"
  default     = ""
}
