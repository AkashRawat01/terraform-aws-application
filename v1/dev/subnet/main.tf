resource "aws_subnet" "private" {
  vpc_id     = data.terraform_remote_state.vpc.outputs.vpc_id
  cidr_block = var.cidr_block
  tags = {
    Name = "${var.project_name}-private-subnet"
  }
}

