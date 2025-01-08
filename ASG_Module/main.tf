resource "aws_ami_from_instance" "my_ami" {
  source_instance_id = var.my_instance_id
  name               = "my-instance-ami"
  description        = "AMI created from instance for ASG"
  tags = {
    Name = "my-instance-ami"
  }
}


# Create Launch Template
resource "aws_launch_template" "my_launch_template" {
  name_prefix   = "my-launch-template-"
  image_id      = aws_ami_from_instance.my_ami.id
  instance_type = "t2.micro" 
  key_name = var.key_name
  # network_interfaces {
  #   security_groups = [var.security_group_id]
  #   #associate_public_ip_address = true  # Optional, depending on your use case
  # }
  vpc_security_group_ids = [ var.security_group_id ]
}

# Create Auto Scaling Group
resource "aws_autoscaling_group" "my_asg" {
  #availability_zones = ["us-west-1b", "us-west-1c"]
  desired_capacity   = 2
  max_size           = 4
  min_size           = 1
  vpc_zone_identifier = [ var.private_subnet_id_1, var.private_subnet_id_2  ]
  target_group_arns   = [var.my_target_group]
  launch_template {
    id      = aws_launch_template.my_launch_template.id
    version = "$Latest"
  }

    tag {
    key                 = "Name"
    value               = "AutoScalingInstance"
    propagate_at_launch = true
  }

}
