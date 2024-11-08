resource "aws_route_table" "private_app02" {
  vpc_id = aws_vpc.app02.id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      nat_gateway_id             = aws_nat_gateway.nat.id
      carrier_gateway_id         = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      gateway_id                 = ""
      instance_id                = ""
      ipv6_cidr_block            = ""
      local_gateway_id           = ""
      network_interface_id       = ""
      transit_gateway_id         = aws_ec2_transit_gateway.transitGW.id
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    },
  ]

  tags = {
    Name = "private for vpc app 02"
  }
}


resource "aws_route_table" "private_app03" {
  vpc_id = aws_vpc.app03.id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      nat_gateway_id             = aws_nat_gateway.nat.id
      carrier_gateway_id         = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      gateway_id                 = ""
      instance_id                = ""
      ipv6_cidr_block            = ""
      local_gateway_id           = ""
      network_interface_id       = ""
      transit_gateway_id         = aws_ec2_transit_gateway.transitGW.id
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    },
  ]

  tags = {
    Name = "private for vpc app 03"
  }
}







resource "aws_route_table" "public" {
  vpc_id = aws_vpc.app01.id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      gateway_id                 = aws_internet_gateway.igw_for_app01.id
      nat_gateway_id             = ""
      carrier_gateway_id         = ""
      destination_prefix_list_id = ""
      egress_only_gateway_id     = ""
      instance_id                = ""
      ipv6_cidr_block            = ""
      local_gateway_id           = ""
      network_interface_id       = ""
      transit_gateway_id         = ""
      vpc_endpoint_id            = ""
      vpc_peering_connection_id  = ""
    },
  ]

  tags = {
    Name = "public for vpc app01 "
  }
}

# Route table associations for private subnets

# resource "aws_route_table_association" "private-ap-northeast-1a" {
#   subnet_id      = aws_subnet.private-ap-northeast-1a.id
#   route_table_id = aws_route_table.private.id
# }

resource "aws_route_table_association" "public-sa-east-1a" {
  subnet_id      = aws_subnet.public-sa-east-1a.id
  route_table_id = aws_route_table.public.id
}

# resource "aws_route_table_association" "public-sa-east-1a" {
#   subnet_id      = aws_subnet.public-sa-east-1a.id
#   route_table_id = aws_route_table.public.id
# }
# resource "aws_route_table_association" "private-ap-northeast-1d" {
#   subnet_id      = aws_subnet.private-ap-northeast-1d.id
#   route_table_id = aws_route_table.private.id
# }

resource "aws_route_table_association" "private02_route-sa-east-1c" {
  subnet_id      = aws_subnet.private02-sa-east-1c.id
  route_table_id = aws_route_table.private_app02.id
}
# resource "aws_route_table_association" "private-ap-northeast-1c" {
#   subnet_id      = aws_subnet.private-ap-northeast-1c.id
#   route_table_id = aws_route_table.private.id
# }

resource "aws_route_table_association" "private03-route-sa-east-1c" {
  subnet_id      = aws_subnet.private03-sa-east-1c.id
  route_table_id = aws_route_table.private_app03.id
}


resource "aws_route" "private_app02_transit" {
  route_table_id       = aws_route_table.private_app02.id
  transit_gateway_id   = aws_ec2_transit_gateway.transitGW.id
  destination_cidr_block = "10.0.0.0/8" # Adjust as per your inter-VPC routing needs
}

resource "aws_route" "private_app03_transit" {
  route_table_id       = aws_route_table.private_app03.id
  transit_gateway_id   = aws_ec2_transit_gateway.transitGW.id
  destination_cidr_block = "10.0.0.0/8" # Adjust as per your inter-VPC routing needs
}
#public

# resource "aws_route_table_association" "public-ap-northeast-1a" {
#   subnet_id      = aws_subnet.public-ap-northeast-1a.id
#   route_table_id = aws_route_table.public.id
# }


# resource "aws_route_table_association" "public-ap-northeast-1d" {
#   subnet_id      = aws_subnet.public-ap-northeast-1d.id
#   route_table_id = aws_route_table.public.id
# }


# resource "aws_route_table_association" "public-ap-northeast-1c" {
#   subnet_id      = aws_subnet.public-ap-northeast-1c.id
#   route_table_id = aws_route_table.public.id
# }


####### Summary of changes needed:
# 1. Create a new internet gateway for app02 and app03 if they need public access.



# 2. Create a NAT gateway for app02 and app03 if they need to access the internet.


# 3. Create route tables for app02 and app03, and associate them with the respective subnets.


# 4. Ensure that the route tables for app02 and app03 have the correct routes for internet access (using the NAT gateway for private subnets and the internet gateway for public subnets).


# 5. Ensure that the route table associations are correctly set up for the subnets in app02 and app03.


# 6. Ensure that the tags for all resources are consistent and meaningful.

# 7. Review the CIDR blocks to ensure they do not overlap and are correctly assigned.

# 8. Ensure that the resources are created in the correct order using the `depends_on` attribute where necessary.



# 9. Validate the configuration using `terraform validate` and `terraform plan` to ensure there are no errors before applying the changes.


