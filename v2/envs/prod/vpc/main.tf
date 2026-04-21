provider "aws" {
  region = var.region
}

module "vpc" {
  source = "../../../modules/vpc"

  project_name = "dev"
  cidr_block   = "10.0.0.0/16"
}
