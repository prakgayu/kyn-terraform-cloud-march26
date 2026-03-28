resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_alb.app_lb.arn 
  port               = 80 
  protocol           = "HTTP" 
  default_action {
    target_group_arn = aws_lb_target_group.app_tg.arn
    type             = "forward"
  }
}