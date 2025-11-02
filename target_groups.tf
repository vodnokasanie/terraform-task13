resource "aws_lb_target_group" "blue_tg" {
  name     = "cmtr-ghjc0xhd-blue-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    enabled             = true
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    path                = "/"
    matcher             = "200"
  }

  tags = {
    Name        = "cmtr-ghjc0xhd-blue-tg"
    Environment = "Blue"
  }
}

resource "aws_lb_target_group" "green_tg" {
  name     = "cmtr-ghjc0xhd-green-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    enabled             = true
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    path                = "/"
    matcher             = "200"
  }

  tags = {
    Name        = "cmtr-ghjc0xhd-green-tg"
    Environment = "Green"
  }
}