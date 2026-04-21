provider "aws" {
  region = var.region
}

module "vpc" {
  source = "git@github.com:AkashRawat01/terraform-aws-vpc.git?ref=0.1.1"

  project_name = "dev"
  cidr_block   = var.cidr_block
}
