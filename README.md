# policy-library-aws-infra

Sentinel policy library to govern AWS infra created by Terraform. Includes S3 controls (encryption, public access block, versioning), EC2 instance-type allowlist, and required tags.

## Policies

- `s3_require_encryption.sentinel` – Require SSE-S3 or SSE-KMS on buckets.
- `s3_block_public_access.sentinel` – Enforce all four Public Access Block flags = true.
- `s3_require_versioning.sentinel` – Require bucket versioning Enabled.
- `ec2_instance_type_allowlist.sentinel` – Allow only selected instance types.
- `required_tags.sentinel` – Ensure core tags (Owner, Env) exist on key resources.

## How to use (HCP Terraform / Terraform Enterprise)

### Option A — Attach as a Policy Set from VCS (UI)
1. Push this repo to GitHub.
2. In **HCP Terraform**, create a **policy set** and connect this VCS repo.  
3. Choose **Sentinel** kind and select workspaces to target; set enforcement levels.  
(Policy sets apply to runs of those workspaces; failed policies can block runs depending on enforcement.)  
See: *Upload your Sentinel policy set to HCP Terraform* (tutorial). [7](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

### Option B — Attach as code (TFE provider)
Use the example in `terraform/attach-policy-set/` to create a `tfe_policy_set` that references this repo (VCS) and attaches it to one or more workspaces. [4](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/imagebuilder_infrastructure_configuration)

## Publishing as a Policy Library (Terraform Registry)
- Repo must be **public** and named `policy-library-<NAME>`, e.g., `policy-library-aws-infra`.
- Must include a **root `sentinel.hcl`** file listing policies/modules.
- Push a **semver tag** like `v0.1.0` and publish via the Registry UI.  
(Policy libraries render docs similar to modules.) [3](https://www.devopshint.com/publish-terraform-module-in-terraform-registry/)

## Local Testing (optional)
Use the **Sentinel CLI** with `tfplan/v2` mock data to test policies locally.  
See HashiCorp tutorial: *Write a Sentinel policy for a Terraform deployment*. [6](https://xfuture-blog.com/posts/automating-builds-and-releases-with-conventional-commits-and-semantic-versioning/)


# Project Structure

<pre>

policy-library-aws-infra/
├── README.md
├── sentinel.hcl
├── policies/
│   ├── common.sentinel
│   ├── s3_require_encryption.sentinel
│   ├── s3_block_public_access.sentinel
│   ├── s3_require_versioning.sentinel
│   ├── ec2_instance_type_allowlist.sentinel
│   └── required_tags.sentinel
└── terraform/
    └── attach-policy-set/
        ├── main.tf
        ├── variables.tf
        └── versions.tf


</pre>