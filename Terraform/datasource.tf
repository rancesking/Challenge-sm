data "aws_eks_cluster" "cluster" {
  name = module.eks_cluster.aws_eks_cluster_ID
}

data "template_file" "aim-policy_file4" {
  template = file("${path.module}/policies/eks-access-policy.json")
  vars = {
    resource-name = module.eks_cluster.aws_eks_cluster_arn

  }
}

data "template_file" "aws_auth" {
  template = file("${path.module}/policies/aws-auth.yaml")
  vars = {
    rolearn  = module.eks_worker_nodes.aws_eks_node_group_role_arn
    userarn  = aws_iam_user.eks_user.arn
    username = aws_iam_user.eks_user.name
  }
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks_cluster.aws_eks_cluster_ID
}