resource "aws_eip" "nat" {
  vpc =  true
  tags = {
    Name = "nat"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.aws_vpc.app01.id # for app01 --- do I need one for app02 and app03?

  tags = {
    Name = "nat"
  }

  depends_on = [aws_internet_gateway.igw]
}
