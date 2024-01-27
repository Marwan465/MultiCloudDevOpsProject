resource "aws_subnet" "public" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = "us-east-1a"  # Specify the desired availability zone
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }
}