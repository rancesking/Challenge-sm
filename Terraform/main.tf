#Random name prefix for the cluster
resource "random_string" "name" {
  length  = 16
  special = false
}

module "eks_cluster" {
  source                  = "./modules/eks_cluster"
  private_subnets_eks_ids = lookup(local.priv_subnet_map, var.env)
  vpc_id                  = lookup(local.vm_vpc_map, var.env)
  cluster-name            = local.cluster_name
}

module "vpc" {
  source                  = "./modules/vpc"
  cluster-name            = local.cluster_name
}

module "eks_worker_nodes" {
  source                  = "./modules/eks_worker_nodes"
  worker_name             = local.worker_name
  instance_types          = split(",", lookup(local.vm_size_map, var.instance_type))
  aws_eks_cluster_name    = local.cluster_name
  private_subnets_eks_ids = lookup(local.priv_subnet_map, var.env)
  policy_file3            = file("${path.module}/policies/iam-policy.json")
  depends_on              = [module.eks_cluster]
}

module "lb_role" {
  source    = "terraform-aws-modules/iam/aws//modules/iam-role-for-service-accounts-eks"

  role_name = "${var.env}_eks_lb"
  attach_load_balancer_controller_policy = true

  oidc_providers = {
    main = {
      provider_arn               = module.eks_cluster.oidc_provider_arn
      namespace_service_accounts = ["kube-system:aws-load-balancer-controller"]
    }
  }
}
