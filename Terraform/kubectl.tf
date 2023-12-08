provider "kubectl" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
  load_config_file       = false
}

resource "kubectl_manifest" "aws_auth" {
  yaml_body  = data.template_file.aws_auth.rendered
  depends_on = [helm_release.lb]
}
