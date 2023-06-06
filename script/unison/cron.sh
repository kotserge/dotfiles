#!/bin/sh

# This script configures the cron job for unison.

# The cron job for main-storage is run daily at 21:00.
crontab -l | { cat; echo "0 21 * * * unison main-storage"; } | crontab -

# The cron job for backup-storage is run weekly at 21:00 on Sunday.
crontab -l | { cat; echo "0 21 * * 0 unison backup-storage"; } | crontab -