# Need one public subnet for vpc1 and one private subnet
resource "aws_vpc" "app01" {
  cidr_block = "10.100.0.0/16"

  tags = {
    Name = "app01"
    Service = "application01"
    Owner = "marvin"
    Planet = "Area100"
  }
}

# need one private subnet for this vpc
resource "aws_vpc" "app02" {
  cidr_block = "10.101.0.0/16"

  tags = {
    Name = "app02"
    Service = "application011"
    Owner = "marvin"
    Planet = "Area101"
  }
}

# need one private subnet for this vpc
resource "aws_vpc" "app03" {
  cidr_block = "10.102.0.0/16"

  tags = {
    Name = "app03"
    Service = "application03"
    Owner = "marvin"
    Planet = "Area102"
  }
}
