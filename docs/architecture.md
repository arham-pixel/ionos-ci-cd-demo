# Architecture


## Infrastructure Layer

IONOS Cloud provides:

- Datacenter
- Virtual Server
- Network configuration
- Public IP connectivity


Terraform manages:

- Infrastructure provisioning
- Network creation
- Server deployment
- Resource lifecycle management



## Configuration Layer

Ansible manages:

- Server preparation
- Package configuration
- Docker environment
- Application deployment



## Application Layer

Docker provides:

- Container runtime
- Nginx web service
- Application delivery



## Server Configuration

Operating System:

Ubuntu 24.04 LTS


Resources:

- 2 CPU cores
- 2 GB RAM
- 20 GB SSD


## Network Design

Private LAN:

Used for internal communication.


Public LAN:

Used for external connectivity.
