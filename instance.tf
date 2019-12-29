resource "aws_instance" "rails-app-server" {
  ami                         = "ami-0cd744adeca97abb1"
  availability_zone           = "ap-northeast-1a"
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.rails-app-subnet.id
  disable_api_termination     = true
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
    "Name" = "kimitsu-rails-ec2"
  }
  timeouts {}
}

resource "aws_key_pair" "developer" {
  key_name   = "kimitsu-rails-app"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDEqV92n0qUNhR96FkstsOy9ScxhYwvCvDvKIZaQzO2rwVUnl+TZu9u5pOJ+0MraYSTVNgVDU/wrgjwxrT025vSYehuF6bS2QR/hQxc5ex5kQbiIhNMHgx5TsiFDMN87EQr7k1xyOopNnGCwPNxTlbebZwIiBfRurl3AgOasy/cBIokvtEw1O5JbEZnt4boNVDEiMpX9v9Aih4kNp5hMeLdj7R3+CszmcrRhZvXVRF/ZXfFwf2v+3NTEgh6kcWVoqURVqENDlms6Ne64BRA7RozMDwkEJnYFufreklWhbMhsqCX0naQ16Rr5FGjPUF+IlYwJ8UxtDzZtzyXbIL97nIz yunosuke@yunosuke-UX390UAK"
}