resource "aws_lb" "nw_lb" {
  name               = var.nlb_name
  internal           = false
  load_balancer_type = "network"
  subnets            = var.subnet_id

  enable_deletion_protection = false

  tags = {
    Environment = "production"
  }
}

resource "aws_lb_target_group" "nw_lb_tg" {
  name     = var.target_group_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}