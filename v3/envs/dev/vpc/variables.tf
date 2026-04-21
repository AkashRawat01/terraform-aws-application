variable "region" {
  description = "The AWS region to deploy resources to"
  type        = string
  default     = "ap-south-1"
}

variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "201.0.0.0/16"
}
