# Development environment

This directory contains the local development Terraform environment configuration.

## Purpose

- provision the dev environment for the platform
- keep dev-specific values isolated from production
- use safe defaults for testing and iteration

## Suggested files

- `main.tf` for environment wiring
- `terraform.tfvars.example` for safe sample values
- `backend.hcl` if using remote state

Use environment names and tags that clearly identify this as non-production.
