module "common" {
  source = "./modules/common.sentinel"
}

module "s3_utils" {
  source = "./modules/s3_utils.sentinel"
}

module "ec2_utils" {
  source = "./modules/ec2_utils.sentinel"
}



policy "s3_require_encryption" {
  source            = "./policies/s3_require_encryption.sentinel"
  enforcement_level = "hard-mandatory"

  # Optional: enforce specific SSE algorithm and KMS usage
  param "allowed_sse_algorithms" {
    value = ["aws:kms", "AES256"]
  }
  param "require_kms" {
    value = true
  }
}

policy "s3_block_public_access" {
  source            = "./policies/s3_block_public_access.sentinel"
  enforcement_level = "hard-mandatory"

  # Require all four S3 public access block flags
  param "require_all_flags" {
    value = true
  }
}

policy "s3_require_versioning" {
  source            = "./policies/s3_require_versioning.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "ec2_instance_type_allowlist" {
  source            = "./policies/ec2_instance_type_allowlist.sentinel"
  enforcement_level = "advisory"

  # Allowed EC2 instance types (customize as needed)
  param "allowed_instance_types" {
    value = ["t3.micro", "t3a.micro", "t3.small", "t3a.small"]
  }
}

policy "required_tags" {
  source            = "./policies/required_tags.sentinel"
  enforcement_level = "hard-mandatory"

  # Required tag keys (add/remove as needed)
  param "required_tag_keys" {
    value = ["Environment", "Owner", "CostCenter"]
  }

  # Optional: restrict allowable values for specific tags
  # Omit keys or leave arrays empty to not restrict.
  param "allowed_tag_values" {
    value = {
      Environment = ["dev", "test", "stage", "prod"]
    }
  }
}
