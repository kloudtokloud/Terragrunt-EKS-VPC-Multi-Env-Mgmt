# From repo https://github.com/kloudtokloud/EKS-AWS-VPC-Network-Terraform.git #

terraform{
    source = "git::git@github.com:kloudtokloud/EKS-AWS-VPC-Network-Terraform.git//modules"
}

include "remote_state" {
  path = find_in_parent_folders()
}

locals {
  region = "us-east-1"  # Update this with your actual region
}

inputs = {
  environment       = "Production"
  eks_cluster_name  = "Prod-EKS-Demo"
  node_group_name   = "webapp-prod-01"
  node_role_name    = "NodeRole-prod"
  nodegroup_keypair = "webapp-prod-01-key"
  cluster_role      = "AWSEKSClusterRole-dev"
  region_name       = local.region
  vpc_cidr_block    = "10.20.0.0/16"
  public_subnets = {
    "${local.region}a" = "10.20.0.0/24"
    "${local.region}b" = "10.20.2.0/24"
  }
  private_subnets = {
    "${local.region}a" = "10.20.1.0/24"
    "${local.region}b" = "10.20.3.0/24"
  }
}