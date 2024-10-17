variable "vpc_id" {
  description = "ID of the VPC"
}
variable "backend_instance_private_ip" {
  description = "Private IP address of the backend EC2 instance"
  type        = string
}