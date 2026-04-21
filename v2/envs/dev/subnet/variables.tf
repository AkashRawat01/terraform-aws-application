variable "region" {
  description = "The AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "101.0.0.0/24"
}
