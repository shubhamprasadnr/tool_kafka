output "vpc_id" {
  description = "The ID of the created VPC"
  value       = aws_vpc.vpc.id
}

output "public_subnet-1" {
  description = "The IDs of the public subnet-1"
  value       = aws_subnet.public_subnet-1.id
}

output "public_subnet-2" {
  description = "The IDs of the public subnet-2"
  value       = aws_subnet.public_subnet-2.id
}

output "private_subnet-1" {
  description = "The IDs of the private subnet-1"
  value       = aws_subnet.private_subnet-1.id
}

output "private_subnet-2" {
  description = "The IDs of the private subnet-2"
  value       = aws_subnet.private_subnet-2.id
}

output "public_route_table_id" {
  description = "The IDs of the public route table id"
  value       = aws_route_table.pubic_RT.id
}

output "private_route_table_id" {
  description = "The IDs of the private route table id"
  value       = aws_route_table.private_RT.id
}