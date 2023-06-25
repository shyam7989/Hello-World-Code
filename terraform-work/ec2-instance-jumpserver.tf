resource "aws_instance" "public_machine1" {
  instance_type = "t2.micro"
  ami           = "ami-02b8534ff4b424939"
  subnet_id     = aws_subnet.public.id
  vpc_security_group_ids = ["${aws_security_group.ec2.id}"]
  key_name      = "devops"
  tags = {
    Name = "jump-server"
  }
}
