 resource  "aws_route_table" "ag_pub" {
    vpc_id = "${aws_vpc.aws.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
    }

    tags = {
      Name = "agtablePUB"
    }
 }

 resource "aws_route_table_association" "taPUB" {
  subnet_id      = "${aws_subnet.aws_subnet_jenkins.id}"
  route_table_id = "${aws_route_table.ag_pub.id}"
}