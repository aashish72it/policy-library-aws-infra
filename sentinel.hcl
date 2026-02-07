policy "s3_require_encryption" {
  source = "./policies/s3_require_encryption.sentinel"
}

policy "s3_block_public_access" {
  source = "./policies/s3_block_public_access.sentinel"
}

policy "s3_require_versioning" {
  source = "./policies/s3_require_versioning.sentinel"
}

policy "ec2_instance_type_allowlist" {
  source = "./policies/ec2_instance_type_allowlist.sentinel"
}

policy "required_tags" {
  source = "./policies/required_tags.sentinel"
}

module "common" {
  source = "./policies/common.sentinel"
}