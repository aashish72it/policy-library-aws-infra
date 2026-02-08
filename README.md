# policy-library-aws-infra

A **Sentinel policy library** for governing AWS infrastructure provisioned via Terraform.  
This library enforces **security, governance, and cost-control guardrails** at plan time using HashiCorp Sentinel.

It is designed to be:
- ✅ Reusable across multiple workspaces
- ✅ Parameterized for environment flexibility
- ✅ Compatible with Terraform Cloud / Enterprise policy sets
- ✅ Publishable as a Terraform Registry policy library

---

## What this library enforces

### 🪣 Amazon S3
- **Default encryption required**
  - Supports `aws:kms` and `AES256`
  - Optional enforcement of KMS-backed encryption
- **Public access must be blocked**
  - Enforces all four Public Access Block flags
- **Versioning must be enabled**
  - Prevents accidental data loss and overwrites

### 🖥️ Amazon EC2
- **Instance type allowlist**
  - Enforces approved instance families/sizes
  - Supports policy-level overrides via parameters

### 🏷️ Tag Governance
- **Required tags enforcement**
  - Ensures presence of organizational metadata
- **Optional allowed values**
  - Example: restrict `Environment` to `dev | test | stage | prod`

---

## Policy parameters (customizable)

All policies support parameters via `sentinel.hcl`, for example:

- `allowed_sse_algorithms`
- `require_kms`
- `require_all_flags`
- `allowed_instance_types`
- `required_tag_keys`
- `allowed_tag_values`

This allows the same policy logic to be reused across environments without code changes.

---

## Modules

Reusable Sentinel helper modules shared across policies:

- **`common`**
  - Shared helpers / logging utilities
- **`s3_utils`**
  - S3-specific helpers (encryption, versioning checks)
- **`ec2_utils`**
  - EC2-specific helpers (instance allowlists)

Modules are imported by name inside policies (e.g. `import "s3_utils"`), keeping policy logic clean and consistent.

---

## Project structure

<pre>

policy-library-aws-infra/
├── README.md
├── sentinel.hcl
├── modules/
│   ├── common.sentinel
│   ├── s3_utils.sentinel
│   └── ec2_utils.sentinel
├── policies/
│   ├── s3_require_encryption.sentinel
│   ├── s3_block_public_access.sentinel
│   ├── s3_require_versioning.sentinel
│   ├── ec2_instance_type_allowlist.sentinel
│   └── required_tags.sentinel
└── LICENSE

</pre>