# igw for app01 
resource "aws_internet_gateway" "igw_for_app01" {
  vpc_id = aws_vpc.app01.id

  tags = {
    Name    = "app01_IG"
    Service = "application01"
    Owner   = "marvin"
    Planet  = "Area100-feedin"
  }
}


# do I need an igw for app02



# do I need an igw for app03