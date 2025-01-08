output "vpc_id" {
  description = "The ID of the created VPC"
  value       = module.networking_module.vpc_id
}

output "public_subnet-1" {
  description = "The ID of the public subnet-1"
  value       = module.networking_module.public_subnet-1
}

output "public_subnet-2" {
  description = "The ID of the public subnet-2"
  value       = module.networking_module.public_subnet-2
}

output "private_subnet-1" {
  description = "The ID of the private subnet-1"
  value       = module.networking_module.private_subnet-1
}

output "private_subnet-2" {
  description = "The ID of the private subnet-2"
  value       = module.networking_module.private_subnet-2
}

output "public_route_table_id" {
  description = "The IDs of the public route table id"
  value       = module.networking_module.public_route_table_id
}

output "private_route_table_id" {
  description = "The IDs of the private route table id"
  value       = module.networking_module.private_route_table_id
}

output "publc_SG" {
  description = "The ID of the created public_SG"
  value       = module.security_module.public_SG
}

output "private_SG" {
  description = "The ID of the created private_SG"
  value       = module.security_module.private_SG
}

output "publc_nacl" {
  description = "The ID of the created public_nacl"
  value       = module.security_module.public_nacl
}

output "private_nacl" {
  description = "The ID of the created private_nacl"
  value       = module.security_module.private_nacl
}

output "pub_instance1" {
  description = "The ID of the public instance"
  value       = module.compute_module.pub_instance1
}

output "priv_instance1" {
  description = "The ID of the private instance"
  value       = module.compute_module.priv_instance1
}

output "priv_instance2" {
  description = "The ID of the private instance"
  value       = module.compute_module.priv_instance2
}

output "asg_id" {
  description = "my asg id"
  value       = module.asg_module.asg_id
}

output "alb_dns_name" {
  description = "alb dns name"
  value = module.alb_module.alb_dns_name
  
}

output "vpc_peering_connection_id" {
  description = "The ID of the VPC Peering Connection"
  value       = module.vpc_peering_module.vpc_peering_connection_id
}