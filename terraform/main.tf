terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
}

resource "digitalocean_droplet" "example" {
  name   = "example-droplet"
  size   = "s-1vcpu-1gb"
  image  = "ubuntu-20-04-x64"
  region = "nyc1"
  tags   = ["web"]
}

output "droplet_ip" {
  value = digitalocean_droplet.example.ipv4_address
}
