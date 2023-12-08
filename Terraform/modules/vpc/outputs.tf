output "private_subnets_eks_ids" {
  value = aws_subnet.private_subnets_eks[*].id
}

output "public_subnets" {
  value = aws_subnet.public_subnets[*].id
}

output "vpc_id" {
  value = aws_vpc.main_vpc.id
}
