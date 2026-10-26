output "container_name" {
  description = "Name of the provisioned Docker container."
  value       = docker_container.task3.name
}

output "container_id" {
  description = "ID of the provisioned Docker container."
  value       = docker_container.task3.id
}

output "application_url" {
  description = "Local URL for the Nginx welcome page."
  value       = "http://localhost:${var.host_port}"
}
