resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = data.aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "forward"

    forward {
      target_group {
        arn    = data.aws_lb_target_group.blue_tg.arn
        weight = var.blue_weight
      }
      target_group {
        arn    = data.aws_lb_target_group.green_tg.arn
        weight = var.green_weight
      }
    }
  }
}
