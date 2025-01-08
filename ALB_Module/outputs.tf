output "alb_dns_name" {
    description = "dns address"
    value = aws_lb.my_alb.dns_name
  
}

output "my_target_group" {
  description = "Target group ARN"
  value       = aws_lb_target_group.my_target_group.arn
}