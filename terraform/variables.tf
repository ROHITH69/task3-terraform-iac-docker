variable "host_port" {
  description = "Host port mapped to Nginx's container port 80."
  type        = number
  default     = 8088

  validation {
    condition     = var.host_port >= 1024 && var.host_port <= 65535
    error_message = "host_port must be between 1024 and 65535."
  }
}
