resource "aws_instance" "main" {
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id       = var.subnet_id
  key_name        = var.key_name

  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = "my-ec2-instance"
  }

  # User data script (optional)
  user_data = var.user_data
}
