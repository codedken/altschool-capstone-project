# Define Local Values in Terraform
locals {
  owners = var.dept
  env    = var.env

  # Group owners and environment into common_tags
  common_tags = {
    owners      = local.owners
    environment = local.env
  }
}
