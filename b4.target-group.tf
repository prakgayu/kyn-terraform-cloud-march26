resource "aws_lb_target_group" "app_tg" {
  name     = "prakasam-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.sky_vpc.id # Reference a specific VPC ID

  health_check {
    enabled             = true
    interval            = 30
    path                = "/"
    #path                = "/app"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
    matcher             = "200-299" #if the health check response code is between 200 and 299 then it will consider the instance as healthy
  }
}