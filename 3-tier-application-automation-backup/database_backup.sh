#!/bin/bash

DATE=$(date '+%Y-%m-%d_%H:%M:%S')
BACKUP_DIR="$HOME/DB_BACKUP"
BACKUP_FILE="$BACKUP_DIR/mysql_ecomdb_$DATE.sql"

echo "DATABASE Backup started: ${DATE}"

mkdir -p "$BACKUP_DIR"

sudo mysqldump -u root ecomdb > "$BACKUP_FILE"

echo "Back completed: $BACKUP_FILE" 