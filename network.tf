resource "aws_vpc" "rails-app-vpc" {
  cidr_block                       = "10.0.0.0/16"
  tags                             = {
    "Name" = "VPC_for_kimitsu"
  }
}

resource "aws_subnet" "rails-app-subnet" {
  availability_zone               = "ap-northeast-1a"
  cidr_block                      = "10.0.0.0/24"
  vpc_id                          = "${aws_vpc.rails-app-vpc.id}"
  tags                            = {
    "Name" = "kimitsu-subnet1"
  }
}