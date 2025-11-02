resource "aws_autoscaling_group" "blue_asg" {
  name                = "cmtr-ghjc0xhd-blue-asg"
  max_size            = var.desired_capacity
  min_size            = var.desired_capacity
  desired_capacity    = var.desired_capacity
  vpc_zone_identifier = var.subnet_ids

  launch_template {
    id      = aws_launch_template.blue_lt.id
    version = "$Latest"
  }

  target_group_arns = [data.aws_lb_target_group.blue_tg.arn]

  tag {
    key                 = "Name"
    value               = "blue-environment-instance"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "Blue"
    propagate_at_launch = true
  }
}

resource "aws_autoscaling_group" "green_asg" {
  name                = "cmtr-ghjc0xhd-green-asg"
  max_size            = var.desired_capacity
  min_size            = var.desired_capacity
  desired_capacity    = var.desired_capacity
  vpc_zone_identifier = var.subnet_ids

  launch_template {
    id      = aws_launch_template.green_lt.id
    version = "$Latest"
  }

  target_group_arns = [data.aws_lb_target_group.green_tg.arn]

  tag {
    key                 = "Name"
    value               = "green-environment-instance"
    propagate_at_launch = true
  }

  tag {
    key                 = "Environment"
    value               = "Green"
    propagate_at_launch = true
  }
}
