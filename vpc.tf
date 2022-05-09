#VPC and subnets

resource "aws_vpc" "aline-banking-dh-dev-vpc"{
  cidr_block = "10.0.0.0/16"
  tags ={
    "Name" = "Aline Banking VPC - dh"
  }
  
}

resource "aws_subnet" "aline-banking-dh-dev-subnet-1"{
  vpc_id = aws_vpc.aline-banking-dh-dev-vpc.id
  cidr_block = "10.0.10.0/24"
  availability_zone = "us-east-1a"
  tags ={
    "Name" = "Aline Banking Public Subnet 1 dh"
  }
  
}

resource "aws_subnet" "aline-banking-dh-dev-subnet-2"{
  vpc_id = aws_vpc.aline-banking-dh-dev-vpc.id
  cidr_block = "10.0.20.0/24"
  availability_zone = "us-east-1b"
  tags ={
    "Name" = "Aline Banking Public Subnet 2 dh"
  }
}

resource "aws_subnet" "aline-banking-dh-dev-subnet-private-1"{
  vpc_id = aws_vpc.aline-banking-dh-dev-vpc.id
  cidr_block = "10.0.30.0/24"
  availability_zone = "us-east-1c"
  tags ={
    "Name" = "Aline Banking Private Subnet 1 dh"
  }
}

resource "aws_subnet" "aline-banking-dh-dev-subnet-private-2"{
  vpc_id = aws_vpc.aline-banking-dh-dev-vpc.id
  cidr_block = "10.0.40.0/24"
  availability_zone = "us-east-1c"
  tags ={
    "Name" = "Aline Banking Private Subnet 2 dh"
  }
}