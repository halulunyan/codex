variable "environment" {
  description = "Deployment environment (e.g., dev, stage, prod)."
  type        = string
}

variable "cidr_block" {
  description = "Primary CIDR block for the virtual network."
  type        = string
  default     = "10.0.0.0/16"
}
