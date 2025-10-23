# resource "aws_iam_openid_connect_provider" "eks-oidc" {
#   client_id_list  = ["sts.amazonaws.com"]
#   thumbprint_list = [data.tls_certificate.eks-certificate.certificates[0].sha1_fingerprint]
#   url             = data.tls_certificate.eks-certificate.url
# }

output "oidc_arn" {
  value = aws_iam_openid_connect_provider.eks-oidc.arn
}

output "oidc_url" {
  value = aws_iam_openid_connect_provider.eks-oidc.url
  
}

output "cluster_endpoint" {
  description = "EKS cluster endpoint"
  value       = aws_eks_cluster.my_cluster.endpoint
}

output "cluster_name" {
  description = "EKS cluster name"
  value       = aws_eks_cluster.my_cluster.name
}


output "cluster_certificate_authority_data" {
  description = "Base64 encoded certificate data required to communicate with the cluster"
  value       = aws_eks_cluster.my_cluster.certificate_authority[0].data
}

