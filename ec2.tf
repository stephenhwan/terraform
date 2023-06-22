resource "aws_instance" "jenkins" {
  ami           = "ami-082fbd4870b2b4e25"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  key_name      = "ansible"
  iam_instance_profile   = "ssmagent"
  vpc_security_group_ids = ["sg-098ed721f84f0f546"]
  subnet_id     = "subnet-01355caff2bd90f04"
  tags = {
    Name = "Jenkins Master"
  }
}

# Tạo ansible instance
resource "aws_instance" "ansible" {
  ami           = "ami-082fbd4870b2b4e25"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  key_name      = "ansible"
  iam_instance_profile   = "ssmagent"
  vpc_security_group_ids = ["sg-098ed721f84f0f546"]
  subnet_id     = "subnet-01355caff2bd90f04"
  tags = {
    Name = "Ansible"
  }
}

# Tạo Docker instance
resource "aws_instance" "docker" {
  ami           = "ami-082fbd4870b2b4e25"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  key_name      = "ansible"
  iam_instance_profile   = "ssmagent"
  vpc_security_group_ids = ["sg-098ed721f84f0f546"]
  subnet_id     = "subnet-01355caff2bd90f04"
  tags = {
    Name = "Docker"
  }
}