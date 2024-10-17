resource "aws_instance" "main" {
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id       = var.subnet_id
  associate_public_ip_address = var.public_ip
  key_name        = var.key_name

  vpc_security_group_ids = [var.security_group_id]

root_block_device {
    volume_size = var.root_volume_size
  }

  tags = merge({
    Name = var.instance_name
  }, var.instance_tags)
}

#   # User data script (optional)
#   user_data = var.user_data
# }
