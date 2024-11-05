#transit gateway attachment for vpc app 01
resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_attachment_for_vpc_app01_public_and_private" {
  subnet_ids         = [aws_subnet.public-sa-east-1a.id, aws_subnet.private-sa-east-1a.id]
  transit_gateway_id = aws_ec2_transit_gateway.transitGW.id
  vpc_id             = aws_vpc.app01.id

  tags = {
    Name = "transit gateway attachment for vpc app01 "
  }
}


#transit gateway attachment for vpc app 02
resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_attachment_for_vpc_app02_private" {
  subnet_ids         = [aws_subnet.private-sa-east-1b.id]
  transit_gateway_id = aws_ec2_transit_gateway.transitGW.id
  vpc_id             = aws_vpc.app02.id

  tags = {
    Name = "transit gateway attachment for vpc app02 "
  }

}


#transit gateway attachment for vpc app 03
resource "aws_ec2_transit_gateway_vpc_attachment" "tgw_attachment_for_vpc_app03_private" {
  subnet_ids         = [aws_subnet.private-sa-east-1c.id]
  transit_gateway_id = aws_ec2_transit_gateway.transitGW.id
  vpc_id             = aws_vpc.app03.id

  tags = {
    Name = "transit gateway attachment for vpc app03"
  }
}
