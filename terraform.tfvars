vpc_cidr = "192.168.0.0/16"

enable_dns_hostnames = true

enable_dns_support = true

project_name = "My-Pvt-EKS"

environment = "prod"

pub_subnet_count = 2

pri_subnet_count = 2

tags = {
  Environment = "prod"
  Project     = "eks-cluster"
  Owner       = "DevOps"
}

#EKS tfvars 

eks_addons = [
  {
    name    = "vpc-cni"
    version = "v1.18.1-eksbuild.1"   # Manages pod networking
  },
  {
    name    = "coredns"
    version = "v1.11.1-eksbuild.3"   # Internal DNS for services/pods
  },
  {
    name    = "kube-proxy"
    version = "v1.33.3-eksbuild.6"   # Handles Kubernetes networking
  }
]

region = "us-east-1"

cluster_version = "1.33"

cluster_name = "My-EKS-cluster"

