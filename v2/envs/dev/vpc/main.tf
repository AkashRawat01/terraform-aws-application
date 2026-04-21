provider "aws" {
  region = var.region
}

module "vpc" {
  source = "../../../modules/vpc-v2"

  project_name = "dev"
  cidr_block   = var.cidr_block
}
