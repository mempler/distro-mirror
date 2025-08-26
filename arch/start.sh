#!/bin/bash

service cron start
caddy run --config /etc/caddy/Caddyfile
