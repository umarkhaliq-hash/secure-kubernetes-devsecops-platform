# Vault integration

This directory is intended for HashiCorp Vault configuration and secret management examples for the platform.

## Recommended pattern

- Store application secrets and database credentials in Vault.
- Inject them through Kubernetes secrets or CSI drivers.
- Keep environment-specific values out of Git.

## Example usage

1. Enable the KV v2 engine.
2. Store secrets under the `secure-platform/` path.
3. Reference them in Kubernetes manifests using the Vault Agent injector or CSI secret store.
4. Rotate credentials regularly and restrict policies to least privilege.

## Example secret path

```
secret/data/secure-platform/backend
```

This is a placeholder scaffold for production-grade Vault integration.
