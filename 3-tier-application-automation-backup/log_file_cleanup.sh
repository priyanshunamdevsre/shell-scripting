#!/bin/bash
set -euo pipefail

LOG_DIR="/home/ubuntu/var/log/3_tier_application"
BACKUP_DIR="/home/ubuntu/var/log/3_tier_application_backup"

# create backup directory
mkdir -p "$BACKUP_DIR"

echo "Cleanup started at $(date)"

# find, copy, then delete safely
find "$LOG_DIR" -type f -name "*.log" -mmin -15 -exec sh -c '
for file do
    echo "Backing up $file"
    cp "$file" "'"$BACKUP_DIR"'" && rm "$file"
done
' sh {} +

echo "Cleanup completed at $(date)"
