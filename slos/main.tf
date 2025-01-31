terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "~> 3.5.0"  # Use the latest 3.18.x version
    }
  }
}

provider "grafana" {
  url  = "https://sedemo.grafana.net"  # Grafana Cloud URL
  auth = var.grafana_api_token  # API token for authentication
}

# Define the API token variable
variable "grafana_api_token" {
  description = "Grafana Cloud API Token"
  type        = string
  sensitive   = true
}