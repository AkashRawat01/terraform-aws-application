provider "aws" {
  region = var.region
}

module "subnet" {
  source = "../../../modules/subnet"

  project_name = "prod"
  cidr_block   = "20.0.0.0/24"
  vpc_id       = data.terraform_remote_state.vpc.outputs.vpc_id
}
