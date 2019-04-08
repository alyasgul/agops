resource "aws_vpc" "aws" {
  cidr_block = "${var.cidr_block}"

  tags = {
    Name = "alyas_vpc"
  }
}

resource "aws_subnet" "aws_subnet_jenkins" {
  vpc_id     = "${aws_vpc.aws.id}"
  cidr_block = "10.0.0.0/27"
  map_public_ip_on_launch = true

  tags = {
    Name = "alyas_subnet_jenkins"
      }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.aws.id}"

  tags = {
    Name = "alyas_igw"
  }
}
resource "aws_eip" "eip" {
  instance = "${aws_instance.masterjenkins.id}"
  vpc      = true
}
