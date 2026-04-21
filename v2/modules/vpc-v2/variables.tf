variable "region" {
  description = "The AWS region to deploy resources to"
  type        = string
  default     = "ap-south-1"
}

variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "20.0.0.0/16"
}

variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "prod"
}

variable "enable_dns_hostnames" {
  description = "Enable DNS hostnames"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Enable DNS support"
  type        = bool
  default     = true
}
