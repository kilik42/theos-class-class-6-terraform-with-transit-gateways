#  subnets for "app01"
######### public
# Need one public subnet for vpc1 and one private subnet

# public subnet 
resource "aws_subnet" "public-sa-east-1a" {
  vpc_id                  = aws_vpc.app01.id
  cidr_block              = "10.100.1.0/24"
  availability_zone       = "sa-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "public-subnet-vpc-app01"
    Service = "application01"
    Owner   = "marvin"
    Planet  = "Area100_public"
  }
}
#Private subnet for app01

resource "aws_subnet" "private-sa-east-1a" {
  vpc_id                  = aws_vpc.app01.id
  cidr_block              = "10.100.11.0/24"
  availability_zone       = "sa-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name    = "private-subnet-app01"
    Service = "application01"
    Owner   = "Luke"
    Planet  = "Area100__private"
  }
}



##################app02###################################
######## private
#these are for private
# need one private subnet for this vpc
resource "aws_subnet" "private-sa-east-1b" {
  vpc_id            = aws_vpc.app02.id
  cidr_block        = "10.101.11.0/24"
  availability_zone = "sa-east-1b"

  tags = {
    Name    = "private-sa-east-1b"
    Service = "application01"
    Owner   = "marvin"
    Planet  = "Area101_private"
  }
}


##########################app03##############################
# need one private subnet for this vpc
resource "aws_subnet" "private-sa-east-1c" {
  vpc_id            = aws_vpc.app03.id
  cidr_block        = "10.102.11.0/24"
  availability_zone = "sa-east-1c"

  tags = {
    Name    = "private-sa-east-1c"
    Service = "application01"
    Owner   = "Luke"
    Planet  = "Area102_private"
  }
}


