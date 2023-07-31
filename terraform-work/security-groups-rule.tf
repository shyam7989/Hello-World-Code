resource "aws_security_group_rule" "inbound_ssh" {
  type            = "ingress"
  from_port       = 80
  to_port         = 80
  protocol        = "tcp"
  source_security_group_id = aws_security_group.webservers.id

  security_group_id = aws_security_group.ec2.id
}

