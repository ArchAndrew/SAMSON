# backend-bootstrap

Creates the Amazon S3 bucket used for Terraform remote state in SAMSON.

## Features

- S3 bucket for Terraform state
- Versioning enabled
- Server-side encryption (AES256)
- Public access blocked

## State Locking

SAMSON uses Amazon S3 native state locking through Terraform's backend configuration with:

```hcl
use_lockfile = true