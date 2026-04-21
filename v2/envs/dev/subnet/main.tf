provider "aws" {
  region = var.region
}

module "subnet" {
  source = "../../../modules/subnet"

  project_name = "dev"
  cidr_block   = var.cidr_block
  vpc_id       = data.terraform_remote_state.vpc.outputs.vpc_id
}
