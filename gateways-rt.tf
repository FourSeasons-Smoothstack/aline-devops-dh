#Gateways

resource "aws_internet_gateway" "aline-banking-gateway-dh" {
  vpc_id = aws_vpc.aline-banking-dh-dev-vpc.id
  tags = {
    Name = "Aline Banking Internet Gateway -dh"
  }
}

resource "aws_nat_gateway" "aline-banking-gateway-1-dh" {
  allocation_id = aws_eip.nat1.id
  subnet_id     = aws_subnet.aline-banking-dh-dev-subnet-1.id
  tags = {
    "Name" = "Aline Banking NAT Gateway 1 -dh"
  }
}

resource "aws_nat_gateway" "aline-banking-gateway-2-dh" {
  allocation_id = aws_eip.nat2.id
  subnet_id     = aws_subnet.aline-banking-dh-dev-subnet-2.id
  tags = {
    "Name" = "Aline Banking NAT Gateway 2 -dh"
  }
}

#Route Tables 

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.aline-banking-dh-dev-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.aline-banking-gateway-dh.id
  }
  tags = {
    "Name" = "Public Route Table -dh"
  }
}

resource "aws_route_table" "private-1" {
  vpc_id = aws_vpc.aline-banking-dh-dev-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.aline-banking-gateway-2-dh.id
  }
  tags = {
    "Name" = "Private Route Table 1 -dh"
  }
}

resource "aws_route_table" "private-2" {
  vpc_id = aws_vpc.aline-banking-dh-dev-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.aline-banking-gateway-1-dh.id
  }
  tags = {
    "Name" = "Private Route Table 2 -dh"
  }
}

resource "aws_route_table_association" "public-1" {
  subnet_id      = aws_subnet.aline-banking-dh-dev-subnet-1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-2" {
  subnet_id      = aws_subnet.aline-banking-dh-dev-subnet-2.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private-1" {
  subnet_id      = aws_subnet.aline-banking-dh-dev-subnet-private-1.id
  route_table_id = aws_route_table.private-1.id
}

resource "aws_route_table_association" "private-2" {
  subnet_id      = aws_subnet.aline-banking-dh-dev-subnet-private-2.id
  route_table_id = aws_route_table.private-2.id
}

resource "aws_eip" "nat1" {
  depends_on = [aws_internet_gateway.aline-banking-gateway-dh]
}

resource "aws_eip" "nat2" {
  depends_on = [aws_internet_gateway.aline-banking-gateway-dh]
}