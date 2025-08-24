# Coolify Configuration
# This file contains configuration for deploying wplacer with Coolify

# Build Configuration
DOCKERFILE_PATH=./Dockerfile
DOCKER_COMPOSE_PATH=./docker-compose.yml

# Environment Variables for Coolify
NODE_ENV=production
PORT=80

# Health Check
HEALTH_CHECK_PATH=/
HEALTH_CHECK_INTERVAL=30
HEALTH_CHECK_TIMEOUT=10
HEALTH_CHECK_RETRIES=3
HEALTH_CHECK_START_PERIOD=40

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

# Coolify Deployment Configuration für wplacer

## Umgebungsvariablen für Coolify
# Setze diese Variablen in der Coolify-UI:

# NODE_ENV=production
# PORT=80

## Build-Konfiguration
# - **Dockerfile**: `./Dockerfile`
# - **Build Context**: Root-Verzeichnis
# - **Port**: 80 (Standard, kann über PORT-Variable geändert werden)

## Gesundheitschecks
# - **Pfad**: `/` (Root-Route)
# - **Intervall**: 30 Sekunden
# - **Timeout**: 10 Sekunden
# - **Wiederholungen**: 3
# - **Start-Periode**: 40 Sekunden

## Persistente Daten
# Das `/app/data` Verzeichnis wird automatisch als Volume gemountet für:
# - Anwendungsdaten
# - Log-Dateien (`logs.log`, `errors.log`)

## Deployment-Notizen für Coolify
# 1. **Domain**: Konfiguriere Domain/Subdomain in Coolify
# 2. **SSL**: Wird automatisch von Coolify verwaltet
# 3. **Logs**: Verfügbar über Coolify-Interface oder in `/app/data/`
# 4. **Updates**: Push zu GitHub löst automatisches Rebuild aus
# 5. **Rollback**: Über Coolify-Interface verfügbar

## Behobene Probleme
# - ✅ Healthcheck verwendet jetzt `curl` statt `wget`
# - ✅ Entfernt `--env-file=.env` aus package.json
# - ✅ Verbesserte Container-Berechtigungen
# - ✅ Flexiblere Port-Konfiguration
# - ✅ Optimierte .dockerignore für schnellere Builds

## Troubleshooting
# Falls der Container nicht startet:
# 1. Prüfe Logs in Coolify-Interface
# 2. Überprüfe Umgebungsvariablen
# 3. Stelle sicher, dass Port 80 nicht blockiert ist
# 4. Kontrolliere Healthcheck-Status
