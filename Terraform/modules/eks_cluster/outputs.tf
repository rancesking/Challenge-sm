output "aws_eks_cluster_name" {
  value = aws_eks_cluster.eks_cluster.name
}

output "aws_eks_cluster_ID" {
  value = aws_eks_cluster.eks_cluster.id
}

output "aws_eks_cluster_arn" {
  value = aws_eks_cluster.eks_cluster.arn
}

output "aws_eks_cluster_policy_arn" {
  value = aws_iam_role.eks_cluster_role.arn
}

output "oidc_provider_arn" {
  value = aws_iam_openid_connect_provider.eks_cluster.arn
}



