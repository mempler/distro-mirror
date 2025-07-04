FROM debian:bookworm

RUN apt update && \
    apt install -y rsync nginx cron && \
    mkdir -p /var/www/html/arch && \
    touch /var/log/sync.log

COPY sync.sh /usr/local/bin/sync.sh
RUN chmod +x /usr/local/bin/sync.sh

COPY default.conf /etc/nginx/sites-available/default
COPY nginx.conf /etc/nginx/nginx.conf
RUN ln -sf /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

RUN echo "SHELL=/bin/bash\nPATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin\n*/5 * * * * root /usr/local/bin/sync.sh >> /var/log/sync.log 2>&1" > /etc/cron.d/mirrorcron
RUN chmod 0644 /etc/cron.d/mirrorcron

COPY start.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]
