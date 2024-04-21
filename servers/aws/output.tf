output "abp_instance_public_ips" {
  value = [for v in module.e2e_framework_pair : v.abp_instance_public_ip]
}

output "testing_instance_public_ips" {
  value = [for v in module.e2e_framework_pair : v.testing_instance_public_ip]
}
