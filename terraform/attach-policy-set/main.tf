provider "tfe" {}

resource "tfe_policy_set" "aws_infra" {
  name         = "aws-infra-guardrails"
  description  = "S3 encryption/public-block/versioning; EC2 type allowlist; required tags"
  organization = var.organization
  kind         = "sentinel"

  # Attach to specific workspaces OR set global=true
  workspace_ids = var.global ? null : var.workspace_ids
  global        = var.global

  vcs_repo {
    identifier         = var.vcs_repo       # e.g., your-org/policy-library-aws-infra
    branch             = var.branch
    oauth_token_id     = var.oauth_token_id
    ingress_submodules = false
  }
}