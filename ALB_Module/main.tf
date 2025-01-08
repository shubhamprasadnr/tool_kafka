resource "aws_lb" "my_alb" {
  name = "my-alb"
  load_balancer_type = "application"
  internal = false
  security_groups = [var.public_SG]
  subnets = [var.public_subnet_id_1, var.public_subnet_id_2]

}

resource "aws_lb_target_group" "my_target_group" {
  name     = "my-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.my_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_target_group.arn
  }
}

# Attach EC2 instances to the target group
resource "aws_lb_target_group_attachment" "priv_instance_1" {
  target_group_arn = aws_lb_target_group.my_target_group.arn
  target_id        = var.priv_instance_1
  port             = 80
}

resource "aws_lb_target_group_attachment" "priv_instance_2" {
  target_group_arn = aws_lb_target_group.my_target_group.arn
  target_id        = var.priv_instance_2
  port             = 80
}