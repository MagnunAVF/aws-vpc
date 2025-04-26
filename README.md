# AWS VPC Infrastructure

This project provides Terraform configuration for a highly available AWS VPC infrastructure designed for production workloads. The infrastructure spans across three availability zones with dedicated subnet types for different workload requirements.

## Architecture Overview

The infrastructure includes:

- **VPC**: A Virtual Private Cloud with CIDR block 10.0.0.0/16
- **Subnets**: Three types of subnets across three availability zones:
  - **Private Subnets**: For internal resources that don't need direct internet access
  - **Public Subnets**: For resources that need to be publicly accessible
  - **Database Subnets**: Isolated subnets for database instances
- **Gateways**:
  - Internet Gateway for public internet access
  - NAT Gateways in each availability zone for private subnet internet access
- **Route Tables**: Configured for appropriate traffic routing
- **Parameter Store**: All resource IDs are stored in AWS Systems Manager Parameter Store for easy reference

## Network Design

| Subnet Type | Availability Zone A | Availability Zone B | Availability Zone C |
| ----------- | ------------------- | ------------------- | ------------------- |
| Private     | 10.0.0.0/20         | 10.0.16.0/20        | 10.0.32.0/20        |
| Public      | 10.0.48.0/24        | 10.0.49.0/24        | 10.0.50.0/24        |
| Database    | 10.0.51.0/24        | 10.0.52.0/24        | 10.0.53.0/24        |

## Prerequisites

- Terraform >= 0.12
- AWS CLI configured with appropriate credentials
- An AWS account with permissions to create the resources

## Usage

1. Initialize the Terraform configuration:

   ```
   terraform init -backend-config=environment/dev/backend.tfvars
   ```

2. Set the required variables in a `terraform.tfvars` file or use the provided environment files:

   ```
   terraform plan -var-file=environment/dev/terraform.tfvars
   ```

3. Apply the configuration:
   ```
   terraform apply -var-file=environment/dev/terraform.tfvars
   ```

## Variables

| Name         | Description                                                                 | Type   | Required |
| ------------ | --------------------------------------------------------------------------- | ------ | -------- |
| project_name | Name of the project that will be used as a prefix for all resources created | string | Yes      |
| region       | AWS region where resources will be deployed (e.g., us-east-1, eu-west-1)    | string | Yes      |

## Outputs

The infrastructure exports several outputs, all stored in AWS Systems Manager Parameter Store:

- VPC ID
- Private subnet IDs (for each availability zone)
- Public subnet IDs (for each availability zone)
- Database subnet IDs (for each availability zone)

These can be referenced in other Terraform projects using the SSM parameter paths.

## High Availability Design

This infrastructure is designed for high availability:

- Resources are distributed across three availability zones
- Each private subnet has its own NAT Gateway for fault tolerance
- The design allows for zone-specific failures without affecting the entire infrastructure

## Security Considerations

- Private subnets are not directly accessible from the internet
- Database subnets are isolated from direct internet access
- Public subnets are minimized in size and only used where necessary

## License

See the [LICENSE](LICENSE) file for details.
