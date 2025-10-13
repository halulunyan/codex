terraform {
  required_version = ">= 1.5.0"
}

locals {
  image = "${var.image_repository}:${var.image_tag}"
}

resource "null_resource" "service_placeholder" {
  triggers = {
    environment = var.environment
    replica_count = tostring(var.replicas)
    image = local.image
  }
}

output "service_summary" {
  description = "Summary string describing the service deployment."
  value       = "Service ${var.service_name} (${local.image}) with ${var.replicas} replicas"
}
