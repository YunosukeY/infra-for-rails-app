resource "aws_security_group" "rails-app-sg" {
  egress = [
    {
      description      = ""
      protocol         = "-1"
      from_port        = 0
      to_port          = 0
      cidr_blocks      = [
        "0.0.0.0/0",
      ]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]
  ingress = [
    {
      description      = "for http"
      protocol         = "tcp"
      from_port        = 80
      to_port          = 80
      cidr_blocks      = [
        "0.0.0.0/0",
      ]
      ipv6_cidr_blocks = [
        "::/0",
      ]
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      description      = "for rails-app"
      protocol         = "tcp"
      from_port        = 3000
      to_port          = 3000
      cidr_blocks      = [
        "0.0.0.0/0",
      ]
      ipv6_cidr_blocks = [
        "::/0",
      ]
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      description      = "for ssh"
      protocol         = "tcp"
      from_port        = 22
      to_port          = 22
      cidr_blocks      = [
        "121.111.170.239/32",
      ]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]
  name   = "my_sg"
  vpc_id = aws_vpc.rails-app-vpc.id
}