resource "aws_security_group" "DB" {
  vpc_id = var.vpc_id

  
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["${var.backend_instance_private_ip}/24"]
  }
}


