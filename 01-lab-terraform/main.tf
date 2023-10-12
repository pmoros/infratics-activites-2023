terraform {
  required_version = ">= 1.3.0"
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "github" {  
}

resource "github_repository" "infratics_sample_repo" {
  name        = var.repository_name
  description = "A sample repository for infratics created using Terraform"
  visibility  = "public"
  auto_init   = true
}

resource "github_branch" "development" {
repository = github_repository.infratics_sample_repo.name
branch = "development"
}

resource "github_branch" "qa" {
repository = github_repository.infratics_sample_repo.name
branch = "qa"
}

resource "github_branch" "release" {
repository = github_repository.infratics_sample_repo.name
branch = "qa"
}