data "aws_caller_identity" "current" {}

locals {
  github_oidc_subject = "repo:${var.github_owner}@${var.github_owner_id}/${var.github_repository}@${var.github_repository_id}:ref:refs/heads/main"
}