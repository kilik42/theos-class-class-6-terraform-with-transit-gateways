resource "aws_ec2_transit_gateway" "transitGW" {
  description = "Transit Gateway"
  tags ={
    Name = "Web-backed transit gateway"
  }
}