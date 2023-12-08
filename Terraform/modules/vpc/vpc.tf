resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = true

  tags = tomap({
    "kubernetes.io/cluster/${var.cluster-name}" = "shared",
    name = "Simetrik-EKS-VPC"
  })
}

