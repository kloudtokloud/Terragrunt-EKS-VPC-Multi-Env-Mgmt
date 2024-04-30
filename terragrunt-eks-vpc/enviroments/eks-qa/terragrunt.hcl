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
  environment       = "QA"
  eks_cluster_name  = "QA-EKS-Demo"
  node_group_name   = "webapp-qa-01"
  node_role_name    = "NodeRole-qa"
  nodegroup_keypair = "webapp-qa-01-key"
  cluster_role      = "AWSEKSClusterRole-dev"
  region_name       = local.region
  vpc_cidr_block    = "10.30.0.0/16"
  public_subnets = {
    "${local.region}a" = "10.30.0.0/24"
    "${local.region}b" = "10.30.2.0/24"
  }
  private_subnets = {
    "${local.region}a" = "10.30.1.0/24"
    "${local.region}b" = "10.30.3.0/24"
  }
}