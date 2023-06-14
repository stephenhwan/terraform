module "example_vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name            = "projec-1"             # Tên của VPC
  cidr            = "192.168.0.0/20"       # Phạm vi CIDR của VPC
  azs             = ["ap-southeast-1a", "ap-southeast-1b"]   # Khu vực có sẵn để tạo subnet
  public_subnets  = ["192.168.0.0/23", "192.168.2.0/23"]    # Danh sách các subnet công khai

  tags = {
    Terraform   = "true"                  # Nhãn Terraform
    Environment = "dev"                   # Nhãn môi trường
  }
}

resource "aws_subnet" "public_subnet_a" {
  vpc_id            = module.example_vpc.vpc_id               # ID của VPC
  cidr_block        = "192.168.0.0/23"                        # Phạm vi CIDR của subnet
  availability_zone = "ap-southeast-1a"                       # Khu vực có sẵn để tạo subnet

  tags = {
    Name = "public-ip-01"                                    # Tên của subnet công khai
  }
}

resource "aws_route_table_association" "public_subnet_a_rt" {
  subnet_id       = aws_subnet.public_subnet_a.id             # ID của subnet công khai
  route_table_id  = module.example_vpc.main_route_table_id    # ID của bảng định tuyến chính của VPC
}

resource "aws_subnet" "public_subnet_b" {
  vpc_id            = module.example_vpc.vpc_id               # ID của VPC
  cidr_block        = "192.168.2.0/23"                        # Phạm vi CIDR của subnet
  availability_zone = "ap-southeast-1b"                       # Khu vực có sẵn để tạo subnet

  tags = {
    Name = "public-ip-02"                                    # Tên của subnet công khai
  }
}

resource "aws_route_table_association" "public_subnet_b_rt" {
  subnet_id       = aws_subnet.public_subnet_b.id             # ID của subnet công khai
  route_table_id  = module.example_vpc.main_route_table_id    # ID của bảng định tuyến chính của VPC
}
