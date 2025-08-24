# Docker Deployment für wplacer

Dieses Projekt ist jetzt Docker-ready und kann mit Coolify deployed werden.

## 📦 Enthaltene Docker-Dateien

- `Dockerfile` - Haupt-Container-Konfiguration
- `docker-compose.yml` - Lokale Entwicklung und Testing
- `.dockerignore` - Ausgeschlossene Dateien für Docker Build
- `coolify.md` - Spezifische Anweisungen für Coolify

## 🚀 Deployment mit Coolify

### 1. Repository in Coolify hinzufügen
- Fügen Sie Ihr Git-Repository in Coolify hinzu
- Wählen Sie "Docker Compose" oder "Dockerfile" als Build-Typ

### 2. Konfiguration
- **Port**: 80 (Standard)
- **Health Check**: `/` (automatisch konfiguriert)
- **Persistent Storage**: `/app/data` für Logs und Anwendungsdaten

### 3. Umgebungsvariablen (optional)
```
PORT=80
NODE_ENV=production
```

### 4. Domain konfigurieren
- Konfigurieren Sie Ihre Domain/Subdomain in Coolify
- SSL/TLS wird automatisch von Coolify verwaltet

## 🔧 Lokale Entwicklung mit Docker

### Build und Start
```bash
# Mit Docker Compose
docker-compose up --build

# Oder manuell
docker build -t wplacer .
docker run -p 80:80 -v wplacer_data:/app/data wplacer
```

### Zugriff
- Lokale URL: http://localhost
- Die Anwendung erstellt automatisch das `/data` Verzeichnis für Logs

## 📁 Persistent Data

Das Docker-Setup erstellt ein persistentes Volume für:
- `/app/data/logs.log` - Anwendungslogs
- `/app/data/errors.log` - Fehlerlogs
- `/app/data/` - Weitere Anwendungsdaten

## 🔒 Sicherheit

- Container läuft als non-root User (`wplacer:nodejs`)
- Nur notwendige Dateien werden kopiert (siehe `.dockerignore`)
- Minimales Alpine Linux Base Image

## 📋 Systemanforderungen

- Node.js 22+ (wird im Container bereitgestellt)
- Canvas-Abhängigkeiten (automatisch installiert)
- Persistenter Speicher für Logs und Daten

## 🐛 Troubleshooting

### Container startet nicht
- Überprüfen Sie die Logs: `docker logs <container-name>`
- Stellen Sie sicher, dass Port 80 verfügbar ist

### Canvas-Fehler
- Die Canvas-Abhängigkeiten werden automatisch installiert
- Bei Problemen kann ein vollständiger Rebuild helfen: `docker-compose build --no-cache`

### Persistent Data
- Logs und Daten werden in `/app/data` gespeichert
- Bei Coolify wird dies automatisch als Volume gemountet
