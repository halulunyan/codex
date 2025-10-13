variable "environment" {
  description = "Deployment environment (e.g., dev, stage, prod)."
  type        = string
}

variable "storage_tier" {
  description = "Storage tier classification."
  type        = string
  default     = "standard"
}
