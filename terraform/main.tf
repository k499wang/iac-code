terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}
# domain
resource "digitalocean_domain" "domain"{
  name = "k3vinwvng.com"
}
# ssh keys
resource "digitalocean_ssh_key" "k3vinwvng" {
  name       = "Terraform k3vinwvng"
  public_key = file("${path.module}/files/id_rsa.pub")
}

resource "digitalocean_record" "default" {
  domain = digitalocean_domain.domain.name
  type   = "A"
  name   = "@"
  value  =  digitalocean_droplet.k3vinwvng.ipv4_address
}


provider "digitalocean" {
}

resource "digitalocean_droplet" "k3vinwvng" {
  name   = "k3vinwvng-droplet"
  size   = "s-1vcpu-1gb"
  image  = "ubuntu-20-04-x64"
  region = "nyc1"
  tags   = ["web"]
  monitoring = true

  ssh_keys = [
    digitalocean_ssh_key.k3vinwvng.id
  ]
  user_data = file("${path.module}/files/user-data.sh")
}

output "droplet_ip" {
  value = digitalocean_droplet.k3vinwvng.ipv4_address
}

