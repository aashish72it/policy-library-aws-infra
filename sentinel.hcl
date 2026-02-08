module "common" {
  source = "./modules/common.sentinel"
}

module "s3_utils" {
  source = "./modules/s3_utils.sentinel"
}

module "ec2_utils" {
  source = "./modules/ec2_utils.sentinel"
}