locals {
  availability_zones = ["${var.aws_region}a", "${var.aws_region}b"]
  cluster_prefix     = lower(format("%s-%s-%s", var.env, var.cli_user, random_string.name.result))
  user               = lower(format("%s-%s-%s", var.env, var.cli_user, var.service))
  cluster_name       = substr("${local.cluster_prefix}", 0, 99)
  worker_prefix      = lower(format("%s-%s-%s", var.env, var.cli_user, "_eks_node_group"))
  worker_name        = substr("${local.worker_prefix}", 0, 62)
  vm_size_map = {
    "small"  = "t3a.small"
    "medium" = "t3a.medium"
    "large"  = "t3a.large"
  }
  priv_subnet_map = {
    "dev"  = ["${module.vpc.private_subnets_eks_ids[0]}", "${module.vpc.private_subnets_eks_ids[1]}"]
    "stg"  = ["stg-sn"]
    "prod" = ["prod-sn"]
  }
  public_subnet_map = {
    "dev"  = ["${module.vpc.public_subnets[0]}", "${module.vpc.public_subnets[1]}"]
    "stg"  = ["stg-sn"]
    "prod" = ["prod-sn"]
  }
  vm_vpc_map = {
    "dev"  = "${module.vpc.vpc_id}"
    "stg"  = "stg-vpc"
    "prod" = "prod-vpc"
  }
}