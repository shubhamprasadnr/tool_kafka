output "my_ami_id" {
    description = "my ami id"
    value = aws_ami_from_instance.my_ami.id
}

output "asg_id" {
    description = "asg id"
    value = aws_autoscaling_group.my_asg.id
  
}

output "name" {
  value = aws_autoscaling_group.my_asg.name
}