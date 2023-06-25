resource "aws_instance" "private_machine1" {
  instance_type          = "t2.micro"
  ami                    = "ami-02b8534ff4b424939"
  subnet_id              = aws_subnet.private.id
  vpc_security_group_ids = ["${aws_security_group.ec2.id}"]
  key_name               = "devops"
  user_data              = "${file("/home/terraform/vpc-ser/install_httpd.sh")}"
  tags = {
    Name = "private-machine-1"
  }
}
