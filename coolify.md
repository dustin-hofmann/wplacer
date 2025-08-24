# Coolify Configuration
# This file contains configuration for deploying wplacer with Coolify

# Build Configuration
DOCKERFILE_PATH=./Dockerfile
DOCKER_COMPOSE_PATH=./docker-compose.yml

# Environment Variables for Coolify
PORT=80
NODE_ENV=production

# Health Check
HEALTH_CHECK_PATH=/
HEALTH_CHECK_INTERVAL=30
HEALTH_CHECK_TIMEOUT=10
HEALTH_CHECK_RETRIES=3

# Volume Mounts
# Coolify will automatically handle persistent volumes for:
# - /app/data (for logs and application data)

# Network Configuration
# Default HTTP port: 80
# The application will be accessible via the domain configured in Coolify

# Notes for Coolify Deployment:
# 1. Set environment variables in Coolify UI if needed
# 2. The application uses persistent storage for data directory
# 3. Logs are written to /app/data/logs.log and /app/data/errors.log
# 4. Make sure to configure domain/subdomain in Coolify
# 5. SSL/TLS will be handled automatically by Coolify
