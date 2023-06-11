main.tf

provider "aws" {
  region = "ap-southeast-1"
}
resource "aws_instance" "test-terraform" {
    ami             = "ami-082fbd4870b2b4e25"
    instance_type   = "t2.micro"
    tag = {
        Name = "test"
    }
}