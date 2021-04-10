# Template ref: https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/getting_started
resource "google_compute_instance" "cowrie" {
  name         = "terraformed-cowrie"
  machine_type = "e2-micro"

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
    network = "default"
    access_config {

    }
  }

  tags = ["cowrie"]

  metadata_startup_script = file("scripts/cowrie-boot-ubuntu.sh")
}

resource "google_compute_firewall" "cowrie_ingress" {
    name = "cowrie-ingress"
    network = "default"
    
    allow {
        protocol="tcp"
        ports = ["22","22222"]
    }

    source_ranges = ["0.0.0.0/0"]
    target_tags = ["cowrie"]
  
}