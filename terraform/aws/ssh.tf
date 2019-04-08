resource "aws_security_group" "allow_ssh" {
 name = "allow_ssh"
 vpc_id = "${aws_vpc.aws.id}"

 # SSH access
 ingress {
   from_port   = 22
   to_port     = 22
   protocol    = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
 }
 # Port 80 access
 ingress {
   from_port   = 80
   to_port     = 80
   protocol    = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
 }
 # Outgoing allow all
   egress {
   from_port       = 0
   to_port         = 0
   protocol        = "-1"
   cidr_blocks     = ["0.0.0.0/0"]
 }
 # Ingoing allow all
   ingress {
   from_port       = 8080
   to_port         = 8080
   protocol        = "tcp"
   cidr_blocks     = ["0.0.0.0/0"]
 }
}
