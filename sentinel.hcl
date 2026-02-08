# Modules
module "common" {
  source = "./modules/common.sentinel"
}

module "s3_utils" {
  source = "./modules/s3_utils.sentinel"
}

module "ec2_utils" {
  source = "./modules/ec2_utils.sentinel"
}

# Policies
policy "s3_require_encryption" {
  source = "./policies/s3_require_encryption.sentinel"
  enforcement_level = "hard-mandatory" # Registry ignores, safe to keep :contentReference[oaicite:1]{index=1}

  params = {
    allowed_sse_algorithms = ["aws:kms", "AES256"]
    require_kms            = true
  }
}

policy "s3_block_public_access" {
  source = "./policies/s3_block_public_access.sentinel"
  enforcement_level = "hard-mandatory"

  params = {
    require_all_flags = true
  }
}

policy "s3_require_versioning" {
  source = "./policies/s3_require_versioning.sentinel"
  enforcement_level = "hard-mandatory"
}

policy "ec2_instance_type_allowlist" {
  source = "./policies/ec2_instance_type_allowlist.sentinel"
  enforcement_level = "advisory"

  params = {
    allowed_instance_types = ["t3.micro", "t3a.micro", "t3.small", "t3a.small"]
  }
}

policy "required_tags" {
  source = "./policies/required_tags.sentinel"
  enforcement_level = "hard-mandatory"

  params = {
    required_tag_keys = ["Environment", "Owner", "CostCenter"]
    allowed_tag_values = {
      Environment = ["dev", "test", "stage", "prod"]
    }
  }
}
