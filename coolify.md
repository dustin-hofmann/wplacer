# Coolify Configuration
# This file contains configuration for deploying wplacer with Coolify

# Build Configuration
DOCKERFILE_PATH=./Dockerfile
DOCKER_COMPOSE_PATH=./docker-compose.yml

# Environment Variables for Coolify
NODE_ENV=production
PORT=5678
HOST=0.0.0.0

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

# ```
# NODE_ENV=production
# PORT=5678
# HOST=0.0.0.0
# ```

## Build-Konfiguration
# - **Dockerfile**: `./Dockerfile`
# - **Build Context**: Root-Verzeichnis
# - **Port**: 5678 (wie in .env definiert)
# - **Health Check Port**: 5678

## Gesundheitschecks
# - **Pfad**: `/` (Root-Route)
# - **Port**: 5678
# - **Intervall**: 30 Sekunden
# - **Timeout**: 10 Sekunden
# - **Wiederholungen**: 3
# - **Start-Periode**: 40 Sekunden

## Persistente Daten
# Das `/app/data` Verzeichnis wird automatisch als Volume gemountet für:
# - Anwendungsdaten
# - Log-Dateien (`logs.log`, `errors.log`)

## Port-Konfiguration WICHTIG!
# ⚠️ **Der Service läuft auf Port 5678, nicht auf Port 80!**
# - Stelle sicher, dass Coolify den Service auf Port 5678 erwartet
# - Die .env-Datei definiert PORT=5678
# - Alle Docker-Konfigurationen sind auf Port 5678 ausgelegt

## Deployment-Notizen für Coolify
# 1. **Domain**: Konfiguriere Domain/Subdomain in Coolify
# 2. **Port**: Stelle sicher, dass Coolify Port 5678 verwendet
# 3. **SSL**: Wird automatisch von Coolify verwaltet
# 4. **Logs**: Verfügbar über Coolify-Interface oder in `/app/data/`
# 5. **Updates**: Push zu GitHub löst automatisches Rebuild aus
# 6. **Rollback**: Über Coolify-Interface verfügbar

## Behobene Probleme
# - ✅ Port-Konfiguration von 80 auf 5678 geändert (entspricht .env)
# - ✅ .env-Datei Support wieder aktiviert
# - ✅ HOST auf 0.0.0.0 gesetzt für externe Erreichbarkeit
# - ✅ Healthcheck verwendet curl auf Port 5678
# - ✅ Alle Docker-Konfigurationen konsistent auf Port 5678

## Troubleshooting
# Falls der Container nicht startet:
# 1. Prüfe, ob Coolify Port 5678 verwendet (nicht 80)
# 2. Überprüfe Logs in Coolify-Interface
# 3. Stelle sicher, dass .env-Datei korrekt gelesen wird
# 4. Kontrolliere Healthcheck-Status auf Port 5678
