# Infrastructure as Code (IaC) for Kevin's Website

This repository contains Infrastructure as Code (IaC) for provisioning and configuring infrastructure using Terraform and Ansible. This is for k3vinwvng.com, kevin's personal website and blog.

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) - Ensure you have Terraform installed (version X.X.X or later).
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) - Ensure you have Ansible installed (version X.X.X or later).
- [Optional] [Python](https://www.python.org/downloads/) - If using Python-based scripts.


### Setup

Create your digital ocean token, and set your environment variable called DIGITALOCEAN_TOKEN to that value.

ex) On Windows: `$env:DIGITALOCEAN_TOKEN="your_token"`

- Then Create valid private and public SSH keys and configure them in terraform/files/id_rsa.pub
- Install the terraform digitalocean provider: `terraform init`
- Apply the terraform plan: `terraform apply`

- Then, you can configure the droplet with Ansible

`ansible-playbook -i <droplet_ip>, playbook.yml --private-key /path/to/your/private_key`

- But first make sure you modify the <ip> section in the Inventory.ini file.

## Contact Information

Contact k499wang@uwaterloo.ca for more details.