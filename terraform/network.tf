resource "aws_vpc" "rails-app-vpc" {
  cidr_block = "10.0.0.0/16"
  tags       = {
    "Name" = "my-vpc"
  }
}

resource "aws_subnet" "rails-app-subnet" {
  availability_zone = var.az
  cidr_block        = "10.0.0.0/24"
  vpc_id            = aws_vpc.rails-app-vpc.id
  tags              = {
    "Name" = "my-subnet"
  }
}

resource "aws_internet_gateway" "rails-app-gw" {
  vpc_id = aws_vpc.rails-app-vpc.id
  tags   = {
    "Name" = "my-gateway"
  }
}

resource "aws_route_table" "rails-app-rt" {
  vpc_id = aws_vpc.rails-app-vpc.id
  tags = {
    Name = "my-rt"
  }
}

resource "aws_route_table_association" "rails-app-subnet-assoc-rt" {
  subnet_id      = aws_subnet.rails-app-subnet.id
  route_table_id = aws_route_table.rails-app-rt.id
}

resource "aws_route" "rails-app-route-igw" {
  route_table_id         = aws_route_table.rails-app-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.rails-app-gw.id
  depends_on             = [aws_route_table.rails-app-rt]
}