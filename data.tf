data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

data "aws_lb" "alb" {
  name = "cmtr-ghjc0xhd-lb"
}

data "aws_lb_target_group" "blue_tg" {
  name = "cmtr-ghjc0xhd-blue-tg"
}

data "aws_lb_target_group" "green_tg" {
  name = "cmtr-ghjc0xhd-green-tg"
}
