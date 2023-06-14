provider "aws" {
  region     = "us-west-2"
  access_key = "AKIAWCHAWBPFJESIZR5K"
  secret_key = "9wo9aBaFSOzakWkZabc3x9FZtr9Wj6f8ODtbtXxD"
}

# Tạo VPC
resource "aws_vpc" "example_vpc" {
  cidr_block = "192.168.0.0/20"

  tags = {
    Name = "projec-1"
 }
}

# Tạo Internet Gateway và liên kết với VPC
resource "aws_internet_gateway" "example_igw" {
  vpc_id = aws_vpc.example_vpc.id
}

# Tạo route table cho public subnet
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.example_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.example_igw.id
  }
}

# Tạo public subnet 1 với địa chỉ IP public thuộc availability zone a
resource "aws_subnet" "public_subnet_a" {
  vpc_id            = aws_vpc.example_vpc.id
  cidr_block        = "192.168.0.0/23"
  availability_zone = "us-west-2a"

  tags = {
    Name = "public-ip-01"
  }
}

# Gán route table cho public subnet 1
resource "aws_route_table_association" "public_subnet_a_rt" {
  subnet_id       = aws_subnet.public_subnet_a.id
  route_table_id  = aws_route_table.public_rt.id
}

# Tạo public subnet 2 với địa chỉ IP public thuộc availability zone b
resource "aws_subnet" "public_subnet_b" {
  vpc_id            = aws_vpc.example_vpc.id
  cidr_block        = "192.168.2.0/23"
  availability_zone = "us-west-2b"

  tags = {
    Name = "public-ip-02"
  }
}

# Gán route table cho public subnet 2
resource "aws_route_table_association" "public_subnet_b_rt" {
  subnet_id       = aws_subnet.public_subnet_b.id
  route_table_id  = aws_route_table.public_rt.id
}
.