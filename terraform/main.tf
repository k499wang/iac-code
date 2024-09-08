terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}
# ssh keys
resource "digitalocean_ssh_key" "default" {
  name       = "Terraform Example"
  public_key = file("${path.module}/files/id_rsa.pub")
}


provider "digitalocean" {
}

resource "digitalocean_droplet" "example" {
  name   = "example-droplet"
  size   = "s-1vcpu-1gb"
  image  = "ubuntu-20-04-x64"
  region = "nyc1"
  tags   = ["web"]
  monitoring = true
  private_networking = true
  ssh_keys = [
    digitalocean_ssh_key.example.id
  ]
  user_data = file("${path.module}/files/user-data.sh")
}

output "droplet_ip" {
  value = digitalocean_droplet.example.ipv4_address
}

