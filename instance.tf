resource "aws_instance" "rails-app-server" {
  ami           = "ami-0cd744adeca97abb1"
  associate_public_ip_address = true
  instance_type = "t2.micro"
  subnet_id = aws_subnet.rails-app-subnet.id
  disable_api_termination = true
  tags = {
    "Name" = "kimitsu-rails-ec2"
  }
}