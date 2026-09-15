module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "21.25.0"

  name               = "cicd-mod-eks"
  kubernetes_version = "1.36"

  endpoint_public_access  = true
  endpoint_private_access = true

  enable_cluster_creator_admin_permissions = true

  # Explicit shorter IAM role name avoids AWS name-prefix length limits
  iam_role_name            = "cicd-mod-eks-cluster-role"
  iam_role_use_name_prefix = false

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnets

  addons = {
    coredns = {
      most_recent = true
    }

    kube-proxy = {
      most_recent = true
    }

    vpc-cni = {
      most_recent    = true
      before_compute = true
    }
  }

  eks_managed_node_groups = {
    portfolio = {
      name = "cicd-mod-nodes"

      instance_types = [
        "m7i-flex.large"
      ]

      capacity_type = "ON_DEMAND"

      min_size     = 1
      max_size     = 1
      desired_size = 1

      disk_size = 20

      # Explicit shorter node IAM role
      iam_role_name            = "cicd-mod-eks-node-role"
      iam_role_use_name_prefix = false

      labels = {
        workload = "portfolio"
      }
    }
  }

  tags = {
    Project     = var.project_name
    Environment = "portfolio"
  }
}