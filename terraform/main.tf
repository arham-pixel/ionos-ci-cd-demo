# ==========================================================
# IONOS CI/CD Infrastructure Demo
# Terraform Infrastructure Definition
#
# This file defines the cloud resources required for the
# deployment environment.
#
# Created infrastructure:
#
# - IONOS Cloud Datacenter
# - Private Network
# - Public Network
# - Ubuntu Server
# - Storage Volume
# - Private Network Interface
# - Public IP Connection
#
# ==========================================================


terraform {

  # Defines the required IONOS Terraform provider

  required_providers {

    ionoscloud = {

      source  = "ionos-cloud/ionoscloud"

      version = "~> 6.0"

    }

  }

}



# ----------------------------------------------------------
# IONOS Cloud provider configuration
#
# Authentication is handled externally through environment
# variables / Terraform configuration.
#
# ----------------------------------------------------------

provider "ionoscloud" {}





# ----------------------------------------------------------
# Datacenter
#
# Creates the main cloud environment where all resources
# are deployed.
#
# Location:
# Frankfurt Germany
#
# ----------------------------------------------------------

resource "ionoscloud_datacenter" "demo" {

  name = "ci-cd-demo"

  location = "de/fra"

}





# ----------------------------------------------------------
# Private LAN
#
# Internal communication network for server resources.
#
# ----------------------------------------------------------

resource "ionoscloud_lan" "demo_lan" {

  datacenter_id = ionoscloud_datacenter.demo.id

  name = "private-lan"

  public = false

}





# ----------------------------------------------------------
# Public LAN
#
# Network connection used for external communication.
#
# ----------------------------------------------------------

resource "ionoscloud_lan" "public_lan" {

  datacenter_id = ionoscloud_datacenter.demo.id

  name = "public-lan"

  public = true

}





# ----------------------------------------------------------
# Application Server
#
# Ubuntu virtual machine hosting the Docker deployment.
#
# Configuration:
# - 2 CPU cores
# - 2 GB RAM
# - 20 GB SSD storage
#
# ----------------------------------------------------------

resource "ionoscloud_server" "demo_server" {


  name = "terraform-demo-server"


  datacenter_id = ionoscloud_datacenter.demo.id


  cores = 2


  ram = 2048


  availability_zone = "AUTO"


  image_name = "ubuntu"



  # SSH public key used for administration access

  ssh_key_path = [

    "/Users/arhamkhan/.ssh/id_ed25519.pub"

  ]



  # Operating system disk

  volume {

    name = "ubuntu-disk"

    size = 20

    disk_type = "SSD"

  }

}





# ----------------------------------------------------------
# Private Network Interface
#
# Connects the server to the internal LAN.
#
# ----------------------------------------------------------

resource "ionoscloud_nic" "demo_nic" {


  datacenter_id = ionoscloud_datacenter.demo.id


  server_id = ionoscloud_server.demo_server.id


  lan = ionoscloud_lan.demo_lan.id


}





# ----------------------------------------------------------
# Public IP Address
#
# Allocates an external IP address for accessing the server.
#
# ----------------------------------------------------------

resource "ionoscloud_ipblock" "demo_ip" {


  location = "de/fra"


  size = 1


  name = "terraform-demo-public-ip"


}





# ----------------------------------------------------------
# Public Network Interface
#
# Connects the server to the public internet.
#
# ----------------------------------------------------------

resource "ionoscloud_nic" "demo_nic_public" {


  datacenter_id = ionoscloud_datacenter.demo.id


  server_id = ionoscloud_server.demo_server.id


  lan = ionoscloud_lan.public_lan.id


  dhcp = true


  ips = [

    ionoscloud_ipblock.demo_ip.ips[0]

  ]

}
