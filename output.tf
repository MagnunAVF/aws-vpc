output "ssm_vpc_id" {
  description = "VPC ID stored in AWS Systems Manager Parameter Store. This ID is used to identify the VPC where resources will be provisioned."
  value       = aws_ssm_parameter.vpc.id
}

output "ssm_subnet_private_1a" {
  description = "Private subnet ID in availability zone 1a. Value stored in AWS Systems Manager Parameter Store, used to provision resources in a specific private subnet."
  value       = aws_ssm_parameter.private_1a.id
}

output "ssm_subnet_private_1b" {
  description = "Private subnet ID in availability zone 1b. Stored in AWS Systems Manager Parameter Store, used for allocation of resources that require isolation within this availability zone."
  value       = aws_ssm_parameter.private_1b.id
}

output "ssm_subnet_private_1c" {
  description = "Private subnet ID in availability zone 1c. Saved in AWS Systems Manager Parameter Store, it is crucial for creating resources that need to be isolated in this specific zone."
  value       = aws_ssm_parameter.private_1c.id
}

output "ssm_subnet_public_1a" {
  description = "Public subnet ID in availability zone 1a. This ID, from AWS Systems Manager Parameter Store, is used to provision publicly accessible resources in this zone."
  value       = aws_ssm_parameter.public_1a.id
}

output "ssm_subnet_public_1b" {
  description = "Public subnet ID in availability zone 1b. Available via AWS Systems Manager Parameter Store, allows the implementation of resources with public access in this specific zone."
  value       = aws_ssm_parameter.public_1b.id
}

output "ssm_subnet_public_1c" {
  description = "Public subnet ID in availability zone 1c, stored in AWS Systems Manager Parameter Store. Used to configure resources that require public access in this zone."
  value       = aws_ssm_parameter.public_1c.id
}

output "ssm_subnet_databases_1a" {
  description = "Database subnet ID in availability zone 1a. This ID is retrieved from AWS Systems Manager Parameter Store and used for provisioning database instances in this specific zone."
  value       = aws_ssm_parameter.databases_1a.id
}

output "ssm_subnet_databases_1b" {
  description = "Database subnet ID in availability zone 1b. Obtained from AWS Systems Manager Parameter Store, it is essential for allocating database instances that need to be isolated in this zone."
  value       = aws_ssm_parameter.databases_1b.id
}

output "ssm_subnet_databases_1c" {
  description = "Database subnet ID in availability zone 1c, from AWS Systems Manager Parameter Store. Used in provisioning database instances that require isolation in this zone."
  value       = aws_ssm_parameter.databases_1c.id
}