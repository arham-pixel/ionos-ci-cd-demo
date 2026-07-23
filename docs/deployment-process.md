# Deployment Process

## Continuous Deployment Flow

The application deployment follows this sequence:


Source Repository
   |
   v
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


## Deployment Steps

1. Changes are pushed to the main branch.

2. GitHub Actions starts the deployment workflow.

3. The workflow establishes SSH access to the server.

4. Ansible transfers the application configuration.

5. Docker Compose updates the container deployment.

6. The updated application becomes available through the web service.
