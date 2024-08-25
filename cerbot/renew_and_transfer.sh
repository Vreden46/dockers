#!/bin/bash

# Variablen
REMOTE_SERVER="217.160.162.190" # Remote-Server-IP oder Hostname
REMOTE_USER="root"            # Benutzername auf dem Remote-Server
SSH_KEY="/root/.ssh/id_rsa"   # Pfad zum privaten SSH-Schlüssel
DOMAIN="pro-vreden.site"      # Domain für das Zertifikat
EMAIL="tv@pro-vreden.site"    # Email für Certbot
WEBROOT="/home/root/docker/proxy/html" # Pfad zum Webroot auf dem Remote-Server

# Certbot-Befehl über SSH auf dem Remote-Server ausführen
echo "Führe Certbot auf dem Remote-Server aus..."
ssh -i $SSH_KEY $REMOTE_USER@$REMOTE_SERVER "certbot certonly --webroot --webroot-path=$WEBROOT --agree-tos --email $EMAIL -d $DOMAIN"

# Überprüfen, ob der Befehl erfolgreich war
if [ $? -ne 0 ]; then
    echo "Fehler bei der Zertifikatserneuerung auf dem Remote-Server."
    exit 1
fi

# Erfolgsmeldung
echo "Zertifikat für $DOMAIN erfolgreich erneuert."

