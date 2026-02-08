# policy-library-aws-infra

Sentinel policy library to govern AWS infra created by Terraform. Includes S3 controls (encryption, public access block, versioning), EC2 instance-type allowlist, and required tags.

## Policies

- `s3_require_encryption.sentinel` – Require SSE-S3 or SSE-KMS on buckets.
- `s3_block_public_access.sentinel` – Enforce all four Public Access Block flags = true.
- `s3_require_versioning.sentinel` – Require bucket versioning Enabled.
- `ec2_instance_type_allowlist.sentinel` – Allow only selected instance types.
- `required_tags.sentinel` – Ensure core tags (Owner, Env) exist on key resources.



# Project Structure

<pre>

policy-library-aws-infra/
├── README.md
├── sentinel.hcl
├── modules/
│   ├── common.sentinel
│   ├── s3_utils.sentinel
│   └── ec2_utils.sentinel
└── LICENSE


</pre>