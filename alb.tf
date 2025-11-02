resource "aws_lb" "alb" {
  name               = "cmtr-ghjc0xhd-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.lb_sg_id]
  subnets            = var.subnet_ids

  tags = {
    Name = "cmtr-ghjc0xhd-lb"
  }
}