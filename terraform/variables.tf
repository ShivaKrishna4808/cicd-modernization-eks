variable "aws_region" {
  description = "AWS region used for the CI/CD portfolio project"
  type        = string
  default     = "us-west-2"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "cicd-modernization-eks"
}

variable "github_owner" {
  description = "GitHub repository owner"
  type        = string
  default     = "ShivaKrishna4808"
}

variable "github_owner_id" {
  description = "Immutable GitHub repository owner ID"
  type        = string
  default     = "205281864"
}

variable "github_repository" {
  description = "GitHub repository name"
  type        = string
  default     = "cicd-modernization-eks"
}

variable "github_repository_id" {
  description = "Immutable GitHub repository ID"
  type        = string
  default     = "1370681217"
}