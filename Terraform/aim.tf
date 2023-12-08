
resource "aws_iam_user" "eks_user" {
  name = local.user
}

resource "aws_iam_policy" "eks_user_policy" {
  name        = "eks-user-policy"
  description = "User policy to manage eks cluster"
  policy      = data.template_file.aim-policy_file4.rendered
  depends_on  = [module.eks_worker_nodes]
}

resource "aws_iam_access_key" "eks_user_access_key" {
  user = aws_iam_user.eks_user.name

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_iam_user_policy_attachment" "eks_user_policy" {
  policy_arn = aws_iam_policy.eks_user_policy.arn
  user       = aws_iam_user.eks_user.name
}