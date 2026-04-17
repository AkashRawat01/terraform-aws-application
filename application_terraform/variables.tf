variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "101.0.0.0/16"
}

variable "subnet_public_a" {
  description = "The CIDR block for the subnet"
  type        = string
  default     = "101.0.1.0/24"
}

variable "subnet_public_b" {
  description = "The CIDR block for the subnet"
  type        = string
  default     = "101.0.3.0/24"
}

variable "subnet_private_a" {
  description = "The CIDR block for the private subnet"
  type        = string
  default     = "101.0.2.0/24"
}

variable "subnet_private_b" {
  description = "The CIDR block for the private subnet"
  type        = string
  default     = "101.0.6.0/24"
}

variable "subnet_private_data_a" {
  description = "The CIDR block for the private data subnet"
  type        = string
  default     = "101.0.4.0/24"
}

variable "subnet_private_data_b" {
  description = "The CIDR block for the private data subnet"
  type        = string
  default     = "101.0.8.0/24"
}

variable "project_name" {
  type    = string
  default = "my-app"
}
