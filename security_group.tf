resource "aws_security_group" "rails-app-sg" {
  description  = "hoge"
  egress = [
    {
      cidr_blocks      = [
        "0.0.0.0/0",
      ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
      }
    ]
    ingress = [
      {
        cidr_blocks      = [
          "0.0.0.0/0",
        ]
        description      = "http"
        from_port        = 80
        ipv6_cidr_blocks = [
          "::/0",
        ]
        prefix_list_ids  = []
        protocol         = "tcp"
        security_groups  = []
        self             = false
        to_port          = 80
      },
      {
        cidr_blocks      = [
          "0.0.0.0/0",
        ]
        description      = "rails-app"
        from_port        = 3000
        ipv6_cidr_blocks = [
          "::/0",
        ]
        prefix_list_ids  = []
        protocol         = "tcp"
        security_groups  = []
        self             = false
        to_port          = 3000
      },
      {
        cidr_blocks      = [
          "121.111.170.239/32",
        ]
        description      = "ssh"
        from_port        = 22
        ipv6_cidr_blocks = []
        prefix_list_ids  = []
        protocol         = "tcp"
        security_groups  = []
        self             = false
        to_port          = 22
      }
    ]
    name        = "kimitsu_sg"
    vpc_id      = aws_vpc.rails-app-vpc.id
}