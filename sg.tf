resource "aws_security_group" "web_sg" {
  # ... other configuration ...
  ######allow ssh access from anywhere
  name   = "web-sg-prak"
  vpc_id = aws_vpc.sky_vpc.id

  # ... other configuration ...

  dynamic "ingress" {
    for_each = var.allowed_ingress_ports
    content {
      description = "Allow ingress on port ${ingress.value}"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = var.allowed_cidr_blocks
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