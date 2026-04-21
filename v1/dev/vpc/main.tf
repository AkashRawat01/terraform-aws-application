resource "aws_vpc" "dev_vpc" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = false
  enable_dns_support   = false
  tags = {
    Name = "${var.project_name}-vpc"
  }
}
