output "subnet_public_id" {
  value = aws_subnet.subnet_public.id
}

output "security_group_id" {
  value = aws_security_group.security_group.id
}
