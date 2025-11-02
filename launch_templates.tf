locals {
  blue_user_data = <<-EOF
    #!/bin/bash
    mkdir -p /var/www/html
    echo "<html><body><h1>Blue Environment</h1></body></html>" > /var/www/html/index.html
    nohup python3 -m http.server 80 -d /var/www/html &
  EOF

  green_user_data = <<-EOF
    #!/bin/bash
    mkdir -p /var/www/html
    echo "<html><body><h1>Green Environment</h1></body></html>" > /var/www/html/index.html
    nohup python3 -m http.server 80 -d /var/www/html &
  EOF
}

resource "aws_launch_template" "blue_lt" {
  name_prefix   = "cmtr-ghjc0xhd-blue-template-"
  image_id      = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  user_data = base64encode(local.blue_user_data)

  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    security_groups             = [var.ssh_sg_id, var.http_sg_id]
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name        = "blue-environment-instance"
      Environment = "Blue"
    }
  }
}

resource "aws_launch_template" "green_lt" {
  name_prefix   = "cmtr-ghjc0xhd-green-template-"
  image_id      = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type

  user_data = base64encode(local.green_user_data)

  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    security_groups             = [var.ssh_sg_id, var.http_sg_id]
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name        = "green-environment-instance"
      Environment = "Green"
    }
  }
}
