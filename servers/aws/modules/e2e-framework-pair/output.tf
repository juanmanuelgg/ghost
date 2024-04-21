output "abp_instance_public_ip" {
  value = aws_instance.abp_ghost.public_ip
}

output "testing_instance_public_ip" {
  value = aws_instance.testing_suite.public_ip
}
