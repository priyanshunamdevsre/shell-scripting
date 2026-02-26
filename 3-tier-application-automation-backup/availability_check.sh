#!/bin/bash

DATE=$(date '+%Y-%m-%d_%H:%M:%S')
LOG_DIR="$HOME/app_logs/"
LOG_FILE="$LOG_DIR/availability_check_$DATE.log"

mkdir -p "$LOG_DIR"

TIME=$(date '+%Y-%m-%d %H:%M:%S')

APACHE_STATUS=$(curl -o /dev/null -s -w "%{http_code}" http://localhost:80)
NGINX_STATUS=$(curl -o /dev/null -s -w "%{http_code}" http://localhost:8081)

{
	if [ "$APACHE_STATUS" = "200" ]; then
	    echo "$TIME | APACHE UP" 
	else
	    echo "$TIME | APACHE DOWN (HTTP $APACHE_STATUS)"
	fi

	if [ "$NGINX_STATUS" = "200" ]; then
	    echo "$TIME | NGINX UP"
	else
	    echo "$TIME | NGINX DOWN (HTTP $NGINX_STATUS)"
	fi
} >> "$LOG_FILE" 2>&1
