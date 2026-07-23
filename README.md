# IONOS CI/CD Infrastructure Demo


## Overview

Automated cloud infrastructure deployment using Infrastructure as Code and CI/CD automation.


## Technology Stack

- IONOS Cloud
- Terraform
- Ansible
- Docker
- Nginx
- GitHub Actions
- Ubuntu Linux


## Architecture

```
GitHub Repository
        |
        v
GitHub Actions
        |
        v
SSH Authentication
        |
        v
Ansible Deployment
        |
        v
Docker Compose
        |
        v
Nginx Container
        |
        v
IONOS Cloud Server
```


## Infrastructure

Terraform manages:

- IONOS datacenter provisioning
- Virtual server creation
- Network configuration
- Public IP assignment


## Configuration

Ansible manages:

- Server preparation
- Package configuration
- Docker environment
- Application deployment


## Container Deployment

Docker provides:

- Container image creation
- Nginx web service
- Application runtime


## CI/CD Workflow

The deployment workflow is automatically triggered after changes are pushed to the main branch.


Deployment sequence:

1. Code changes are pushed to GitHub

2. GitHub Actions starts the workflow

3. SSH authentication connects to the server

4. Ansible executes the deployment

5. Docker Compose rebuilds the container

6. The updated application is deployed


## Repository Structure

```
terraform/
    Infrastructure provisioning

ansible/
    Server configuration

docker/
    Application container

docs/
    Technical documentation

.github/workflows/
    CI/CD automation
```


## Documentation

Technical documentation:

- Architecture overview
- Deployment process
