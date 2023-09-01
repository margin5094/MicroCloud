resource "google_container_cluster" "my_cluster" {
  name               = "cost-optimized-cluster-1"
  location           = "us-central1-a"
  initial_node_count = 3

  node_config {
    machine_type = "e2-medium"
    disk_size_gb = 25
  }
}
provider "google" {
  credentials = var.credentials_json
  project     = "fleet-garage-389620"
  region      = "us-central1"
}

variable "credentials_json" {
  type    = string
  default = <<EOT
{
  //key_here
}
EOT
}
