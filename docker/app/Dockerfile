# ==========================================================
# IONOS CI/CD Infrastructure Demo
#
# Docker image definition for the web application.
#
# The container uses nginx as a lightweight web server
# to serve the static application page.
#
# ==========================================================


# Base image:
# nginx Alpine provides a small and efficient web server

FROM nginx:alpine



# Copy application webpage into nginx default web directory
#
# After the image is built, nginx serves this file
# through HTTP port 80

COPY index.html /usr/share/nginx/html/index.html
