resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.sky_vpc.id

  tags = {
    Name = "prak-sg"
  }
}