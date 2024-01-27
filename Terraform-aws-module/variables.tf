
# variable "access_key" {
#   description = "IAM acess key"
 
# }
# variable "secret_key" {
#   description = "IAM secret key"
  
# }
# variable "region" {
#   description = "aws region"
#   default     = "us-east-1"
# }

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

variable "ami" {
  description = "ID of the AMI"
  default     = "ami-xxxxxxxxxxxxxxxxx"  # Replace with your valid AMI ID
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
