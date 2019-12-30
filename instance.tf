resource "aws_instance" "rails-app-server" {
  ami                         = var.ami
  availability_zone           = var.az
  associate_public_ip_address = true
  instance_type               = var.instance-type
  subnet_id                   = aws_subnet.rails-app-subnet.id
  disable_api_termination     = false
  key_name                    = aws_key_pair.developer.key_name
  ebs_optimized               = false
  monitoring                  = false
  vpc_security_group_ids      = [
    aws_security_group.rails-app-sg.id
  ]
  credit_specification {
    cpu_credits = "standard"
  }
  tags = {
    "Name" = "my-rails-app-ec2"
  }
  timeouts {}
}

resource "aws_key_pair" "developer" {
  key_name   = "my-key"
  public_key = var.public-key
}