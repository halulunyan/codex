terraform {
  required_version = ">= 1.5.0"
}

resource "null_resource" "data_placeholder" {
  triggers = {
    environment  = var.environment
    storage_tier = var.storage_tier
  }
}

output "storage_endpoint" {
  description = "Placeholder endpoint for data layer integrations."
  value       = "https://${var.environment}.example-data.local"
}
