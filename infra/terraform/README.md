# Terraform Stacks

This folder organises reusable modules under `modules/` and environment specific stacks under `environments/`.

## Usage

1. Populate backend configuration values in each environment's `backend.tf`.
2. Configure credentials for your provider (default assumes AWS).
3. Initialise and plan the desired workspace, for example:

```bash
make terraform-init
make terraform-plan
```

4. Promote changes by targeting the appropriate environment directory.

Modules provided are placeholders and can be replaced with real infrastructure resources.
