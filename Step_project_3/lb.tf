resource "aws_elb" "web_elb" {
  name               = "web-elb"
  # availability_zones = ["eu-north-1a"]
  security_groups    = [aws_security_group.ec2.id]
  subnets            = module.vpc.public_subnets

  listener {
    instance_port     = 9090
    instance_protocol = "HTTP"
    lb_port           = 9090
    lb_protocol       = "HTTP"
  }

  listener {
    instance_port     = 3000
    instance_protocol = "HTTP"
    lb_port           = 3000
    lb_protocol       = "HTTP"
  }

  listener {
    instance_port     = 9100
    instance_protocol = "HTTP"
    lb_port           = 9100
    lb_protocol       = "HTTP"
  }

  listener {
    instance_port     = 9101
    instance_protocol = "HTTP"
    lb_port           = 9101
    lb_protocol       = "HTTP"
  }

  health_check {
    target              = "HTTP:9100/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }

  instances = [aws_instance.first_ec2.id, aws_instance.secon_ec2.id]

  tags = {
    Name = "web-elb"
  }
}
# 9090
# 3000
# 9100
# 9101