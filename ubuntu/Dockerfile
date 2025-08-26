FROM debian:trixie

RUN apt update && \
    apt install -y rsync caddy cron && \
    mkdir -p /var/www/ubuntu && \
    touch /var/log/sync.log

COPY sync.sh /usr/local/bin/sync.sh
RUN chmod +x /usr/local/bin/sync.sh

COPY Caddyfile /etc/caddy/Caddyfile

RUN echo "SHELL=/bin/bash\nPATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin\n*/5 * * * * root /usr/local/bin/sync.sh >> /var/log/sync.log 2>&1" > /etc/cron.d/mirrorcron
RUN chmod 0644 /etc/cron.d/mirrorcron

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
