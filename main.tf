terraform {
  required_providers {
    ionoscloud = {
      source  = "ionos-cloud/ionoscloud"
      version = "~> 6.0"
    }
  }
}

provider "ionoscloud" {}


resource "ionoscloud_datacenter" "demo" {

  name = "ci-cd-demo"

  location = "de/fra"

}


resource "ionoscloud_lan" "demo_lan" {

  datacenter_id = ionoscloud_datacenter.demo.id

  name = "private-lan"

  public = false

}


resource "ionoscloud_lan" "public_lan" {

  datacenter_id = ionoscloud_datacenter.demo.id

  name = "public-lan"

  public = true

}


resource "ionoscloud_server" "demo_server" {

  name = "terraform-demo-server"

  datacenter_id = ionoscloud_datacenter.demo.id

  cores = 2

  ram = 2048

  availability_zone = "AUTO"

  image_name = "ubuntu"

  ssh_key_path = [
    "/Users/arhamkhan/.ssh/id_ed25519.pub"
  ]

  volume {

    name = "ubuntu-disk"

    size = 20

    disk_type = "SSD"

  }

}


resource "ionoscloud_nic" "demo_nic" {

  datacenter_id = ionoscloud_datacenter.demo.id

  server_id = ionoscloud_server.demo_server.id

  lan = ionoscloud_lan.demo_lan.id

}


resource "ionoscloud_ipblock" "demo_ip" {

  location = "de/fra"

  size = 1

  name = "terraform-demo-public-ip"

}


resource "ionoscloud_nic" "demo_nic_public" {

  datacenter_id = ionoscloud_datacenter.demo.id

  server_id = ionoscloud_server.demo_server.id

  lan = ionoscloud_lan.public_lan.id

  dhcp = true

  ips = [
    ionoscloud_ipblock.demo_ip.ips[0]
  ]

}
