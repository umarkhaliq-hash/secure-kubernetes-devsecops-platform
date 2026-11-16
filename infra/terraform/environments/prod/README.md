# Production environment

This directory is reserved for production Terraform configuration and deployment settings.

## Production requirements

- enforce least-privilege access
- use remote state with encryption
- require approval for changes
- separate secrets from code
- enable audit logging and monitoring

## Security checklist

- no raw secrets in source control
- use IAM roles instead of long-lived credentials
- enable versioning and locking on remote state
- validate plans before apply
