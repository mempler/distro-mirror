#!/bin/bash

set -e

echo "==========================================" >> /var/log/sync.log
echo "[$(date)] sync.sh started" >> /var/log/sync.log
echo "[$(date)] Starting Arch Linux mirror sync" >> /var/log/sync.log

MIRROR_DIR="/var/www/arch"
REMOTE="rsync://berlin.mirror.pkgbuild.com/packages/"

echo "[$(date)] Mirror: $REMOTE" >> /var/log/sync.log
echo "[$(date)] Local directory: $MIRROR_DIR" >> /var/log/sync.log

mkdir -p "$MIRROR_DIR"
echo "[$(date)] Starting rsync..." >> /var/log/sync.log

if rsync -rlptH --safe-links --delete-delay --delay-updates --progress "$REMOTE" "$MIRROR_DIR" >> /var/log/sync.log 2>&1; then
    echo "[$(date)] Sync completed successfully" >> /var/log/sync.log
else
    echo "[$(date)] Sync failed with exit code $?" >> /var/log/sync.log
fi

echo "[$(date)] sync.sh finished" >> /var/log/sync.log
echo "==========================================" >> /var/log/sync.log
