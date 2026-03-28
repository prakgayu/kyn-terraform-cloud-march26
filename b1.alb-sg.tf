#lets create our security group for alb
  #cr4eate a new file b1.alb-sg.tf copy line 4 till 29 on line 6 change my name to your name
  resource "aws_security_group" "alb_sg" {
  name   = "alb-sg-prakasam-alb"
  vpc_id = aws_vpc.sky_vpc.id

  dynamic "ingress" {
    for_each = var.allowed_alb_ingress_ports
    content {
      description = "Allow ingress on port ${ingress.value}"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = var.allowed_alb_cidr_blocks 
    }
  }
    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1" #tcp, udp, icmp and all
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}
