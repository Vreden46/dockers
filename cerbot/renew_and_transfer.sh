#!/bin/bash

# Variablen
REMOTE_SERVER="xxx.xxx.xxx.xxx" # Remote-Server-IP oder Hostname
REMOTE_USER="sshuser"            # Benutzername auf dem Remote-Server
SSH_KEY="/sshuser/.ssh/id_rsa"   # Pfad zum privaten SSH-Schlüssel
DOMAIN="example.site"      # Domain für das Zertifikat
EMAIL="sshuser@example.site"    # Email für Certbot
WEBROOT="/home/sshuser/docker/proxy/html" # Pfad zum Webroot auf dem Remote-Server, der Pfad ist nach Installation unterschiedlich

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

