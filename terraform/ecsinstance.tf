#Microservice EC2 instances

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "User-dh" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  subnet_id = aws_subnet.aline-banking-dh-dev-subnet-private-1.id
  tags = {
    Name = "User MS - DH"
  }
}

resource "aws_instance" "Underwriter-dh" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  subnet_id = aws_subnet.aline-banking-dh-dev-subnet-private-2.id

  tags = {
    Name = "Underwriter MS - DH"
  }
}

resource "aws_instance" "Bank-dh" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  subnet_id = aws_subnet.aline-banking-dh-dev-subnet-private-1.id

  tags = {
    Name = "Bank MS - DH"
  }
}

resource "aws_instance" "transaction-dh" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  subnet_id = aws_subnet.aline-banking-dh-dev-subnet-private-2.id

  tags = {
    Name = "Transaction MS - DH"
  }
}
