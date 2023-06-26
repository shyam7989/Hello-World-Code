resource "aws_instance" "webservers1" {
  instance_type          = "t2.micro"
  availability_zone =  "us-east-2b"
  ami                    = "ami-02b8534ff4b424939"
  vpc_security_group_ids = ["${aws_security_group.ec2.id}"]
  key_name               = "devops"
  user_data              = "${file("/home/terraform/vpc-ser/ELB/install_httpd.sh")}"
  tags = {
    Name = "webservers-1"
  }
}

resource "aws_instance" "webservers2" {
  instance_type          = "t2.micro"
  availability_zone =  "us-east-2c"
  ami                    = "ami-02b8534ff4b424939"
  vpc_security_group_ids = ["${aws_security_group.ec2.id}"]
  key_name               = "devops"
  user_data              = "${file("/home/terraform/vpc-ser/ELB/install_httpd.sh")}"
  tags = {
    Name = "webservers-2"
  }
}
