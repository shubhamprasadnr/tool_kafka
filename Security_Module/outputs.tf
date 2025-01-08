output "public_SG" {
  description = "The ID of the created public_SG"
  value       = aws_security_group.public_SG.id
}

output "private_SG" {
  description = "The ID of the created private_SG"
  value       = aws_security_group.private_SG.id
}


# NACL output

output "public_nacl" {
  description = "The ID of the created public_nacl"
  value       = aws_network_acl.public_nacl.id
}

output "private_nacl" {
  description = "The ID of the created private_nacl"
  value       = aws_network_acl.public_nacl.id
}