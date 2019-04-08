data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "masterjenkins" {
  ami           = "${data.aws_ami.ubuntu.id}"
  associate_public_ip_address  = true
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
  subnet_id = "${aws_subnet.aws_subnet_jenkins.id}"
    
  key_name      = "${aws_key_pair.my-key.key_name}"
  instance_type = "t2.micro"
  user_data = <<-EOF
             #!/bin/bash
             apt-get update
             apt-get upgrade -y
             apt-get install apache2 -y
             EOF

  tags = {
    Name = "AGmasterjenkins"
  }
}
resource "aws_instance" "slavejenkins" {
  ami           = "${data.aws_ami.ubuntu.id}"
  associate_public_ip_address  = true
  vpc_security_group_ids = ["${aws_security_group.allow_ssh.id}"]
  subnet_id = "${aws_subnet.aws_subnet_jenkins.id}"
    
  key_name      = "${aws_key_pair.my-key.key_name}"
  instance_type = "t2.micro"
  /*user_data = <<-EOF
             #!/bin/bash
             apt-get update
             apt-get upgrade -y
             apt-get install apache2 -y
             EOF*/

  tags = {
    Name = "AGslavejenkins"
  }
}
