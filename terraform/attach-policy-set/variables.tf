variable "organization" {
  description = "HCP Terraform organization name."
  type        = string
}

variable "vcs_repo" {
  description = "GitHub repo identifier (e.g., your-org/policy-library-aws-infra)."
  type        = string
}

variable "branch" {
  description = "Policy repo branch to read from (e.g., main)."
  type        = string
  default     = "main"
}

variable "oauth_token_id" {
  description = "TFE OAuth token ID for the VCS connection."
  type        = string
  sensitive   = true
}

variable "workspace_ids" {
  description = "IDs of workspaces to attach this policy set to."
  type        = list(string)
  default     = []
}

variable "global" {
  description = "Apply to all workspaces in the org."
  type        = bool
  default     = false
}