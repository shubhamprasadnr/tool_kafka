output "pub_instance1" {
  description = "The ID of the public instance"
  value       = aws_instance.pub_instance1.id
}

output "priv_instance1" {
  description = "The ID of the private instance"
  value       = aws_instance.priv_instance1.id
}

output "priv_instance2" {
  description = "The ID of the private instance"
  value       = aws_instance.priv_instance2.id
}