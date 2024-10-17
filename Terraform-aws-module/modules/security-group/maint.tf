resource "aws_security_group" "main" {
  vpc_id = var.vpc_id
// Outgoind Traffic... port -1 means all protocols. ["0.0.0.0/0"] means all IPs can be limited to certain IPs
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
// Incoming Traffic... port 22 for ssh, 80 for http and 443 for https. ["0.0.0.0/0"] means all IPs can be limited to certain IPs
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


