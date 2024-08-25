FROM ubuntu:20.04



RUN apt update
RUN apt install -y cron
RUN apt install -y openssh-client
RUN apt install -y certbot
RUN apt install -y sshfs

# Arbeitsverzeichnis erstellen
WORKDIR /certbot

# Skript kopieren, das die Zertifikate erstellt und kopiert
COPY renew_and_transfer.sh /certbot/renew_and_transfer.sh
COPY crontab.txt /etc/cron.d/my-cron-zert

# Skript ausführbar machen
RUN chmod +x /certbot/renew_and_transfer.sh
RUN chmod 644 /etc/cron.d/my-cron-zert


ENTRYPOINT cron -f

