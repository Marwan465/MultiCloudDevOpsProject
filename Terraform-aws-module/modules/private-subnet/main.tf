resource "aws_subnet" "private" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.private_subnet_cidr
  availability_zone       = "us-east-1b"  # Specify the desired availability zone

  tags = {
    Name = "private-subnet"
  }
}