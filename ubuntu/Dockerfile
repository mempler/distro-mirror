FROM debian:trixie

RUN apt-get update && \
    apt-get install -y --no-install-recommends rsync caddy cron && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /var/www/ubuntu && \
    touch /var/log/sync.log && \
    printf "SHELL=/bin/bash\nPATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin\n*/5 * * * * root /usr/local/bin/sync.sh >> /var/log/sync.log 2>&1\n" > /etc/cron.d/mirrorcron && \
    chmod 0644 /etc/cron.d/mirrorcron

COPY --chmod=0755 sync.sh /usr/local/bin/sync.sh
COPY Caddyfile /etc/caddy/Caddyfile
COPY --chmod=0755 start.sh /start.sh

CMD ["/start.sh"]
