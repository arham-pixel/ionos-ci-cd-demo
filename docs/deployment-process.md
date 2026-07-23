# Deployment Process

## Continuous Deployment Flow

The application deployment follows this sequence:


Developer
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

1. Code changes are pushed to the main branch.

2. GitHub Actions starts automatically.

3. The workflow authenticates with the server.

4. Ansible transfers application files.

5. Docker Compose rebuilds the container.

6. The updated application becomes available.
