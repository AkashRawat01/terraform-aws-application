data "terraform_remote_state" "vpc" {
  backend = "local"
  config = {
    path = "../vpc/terraform.tfstate"
  }
}

output "vpc_id" {
  value = data.terraform_remote_state.vpc
}
