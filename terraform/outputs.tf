output "ecr_repository_url" {
  description = "Amazon ECR repository URL"
  value       = aws_ecr_repository.app.repository_url
}

output "github_actions_role_arn" {
  description = "IAM role assumed by GitHub Actions through OIDC"
  value       = aws_iam_role.github_actions.arn
}

output "github_oidc_subject" {
  description = "GitHub OIDC subject trusted by AWS"
  value       = local.github_oidc_subject
}

output "eks_cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "EKS API endpoint"
  value       = module.eks.cluster_endpoint
  sensitive   = true
}

output "vpc_id" {
  description = "Portfolio EKS VPC ID"
  value       = module.vpc.vpc_id
}