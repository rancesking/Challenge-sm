output "aws_eks_cluster_name_output" {
  value = module.eks_cluster.aws_eks_cluster_name
}
output "username_output" {
  value = aws_iam_user.eks_user.name
}
# This output exposes the access key ID for the created IAM user.
output "access_key_id" {
  value = aws_iam_access_key.eks_user_access_key.id
}
# This output exposes the secret access key for the created IAM user.
output "secret_access_key" {
  value = nonsensitive(aws_iam_access_key.eks_user_access_key.secret)
}