terraform {
  required_version = ">= 1.5.0"
}

provider "aws" {
  region = var.aws_region
}

variable "aws_region" {
  description = "AWS region for the production environment"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Base project name used in resource naming"
  type        = string
  default     = "secure-kubernetes-devsecops-platform"
}

locals {
  environment = "prod"
  tags = {
    Environment = local.environment
    Project     = var.project_name
    ManagedBy   = "terraform"
    Tier        = "production"
  }
}

output "environment" {
  description = "Deployment environment name"
  value       = local.environment
}

output "tags" {
  description = "Common resource tags"
  value       = local.tags
}
