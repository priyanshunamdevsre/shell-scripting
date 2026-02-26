#!/bin/bash
set -eu

### run health_check_service script on every 5 mints and include the date and time in output and store o/p in a dedicated directory

DATE=$(date '+%Y-%m-%d_%H:%M:%S')
LOG_DIR="/home/ubuntu/var/log/3_tier_application"
LOG_FILE="$LOG_DIR/health_check_$DATE.log"

mkdir -p "$LOG_DIR"

{
	echo "--------------------------" 
	echo "Run Time : $DATE"
	sh /home/ubuntu/Documents/shell-scripting/3-tier-application-automation-backup/health_check_service.sh
	echo "" 

} >> "$LOG_FILE" 2>&1
