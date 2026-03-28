  resource "aws_alb" "app_lb" {
  name = "prakasam-alb"
  load_balancer_type = "application"
  #with this lb we need to add security group and subnet
  security_groups = [aws_security_group.alb_sg.id] #this is the security
  subnets = values(aws_subnet.sky_subnet)[*].id #this is the subnet
  tags = {
    Name = "prakasam-alb"
  }
}