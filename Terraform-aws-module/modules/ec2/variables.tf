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
variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
}

variable "instance_tags" {
  description = "Map of additional tags to assign to the EC2 instance"
  type        = map(string)
}

variable "public_ip" {
  description = "Whether to associate a public IP address"
  type        = bool
  default     = false
}
