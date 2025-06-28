# main.tf (root)
module "network" {
  source = "./modules/network"
}

module "iam" {
  source = "./modules/iam"
}

module "logging" {
  source = "./modules/logging"
}

module "monitoring" {
  source        = "./modules/monitoring"
  log_bucket_id = module.logging.bucket_id
}

module "redshift" {
  source              = "./modules/redshift"
  subnet_ids          = module.network.subnet_ids
  security_group_ids  = [module.network.security_group_id]
  iam_role_arn        = module.iam.iam_role_arn
}
