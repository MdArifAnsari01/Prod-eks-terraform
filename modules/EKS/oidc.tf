resource "aws_iam_openid_connect_provider" "eks-oidc" {
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.eks-certificate.certificates[0].sha1_fingerprint]
  url             = data.tls_certificate.eks-certificate.url
}

/*
By default, EKS uses IAM roles for EC2 nodes. All pods running on that node get the same permissions 
(not secure/flexible).
To give pod-level fine-grained IAM permissions, AWS uses OIDC + IRSA.
*/