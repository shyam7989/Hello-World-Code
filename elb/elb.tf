resource "aws_elb" "devops-elb" {
  name = "devops-elb"
  security_groups = ["${aws_security_group.webservers.id}"]
  availability_zones = ["us-east-2b","us-east-2c"]
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/index.html"
    interval            = 30
  }

  instances                   = [aws_instance.webservers1.id, aws_instance.webservers2.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 100
  connection_draining         = true
  connection_draining_timeout = 300

  tags = {
    Name = "devops_elb"
  }
}

output "elb-dns-name" {
  value = aws_elb.devops-elb.dns_name
}
