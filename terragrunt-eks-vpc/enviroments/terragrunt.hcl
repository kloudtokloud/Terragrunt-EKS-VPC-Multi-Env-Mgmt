generate "backend" {
  path      = "s3-backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
terraform {
    backend "s3" {
        bucket  = "terraform-statefiles-for-eks-vpc-network-terraform"
        key     = "${path_relative_to_include()}/terraform.tfstate"
        region  = "us-east-1"
        encrypt = true
    }
}
EOF
}