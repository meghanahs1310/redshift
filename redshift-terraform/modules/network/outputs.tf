output "subnet_ids" {
  value = [aws_subnet.private.id]
}

output "security_group_id" {
  value = aws_security_group.redshift_sg.id
}
