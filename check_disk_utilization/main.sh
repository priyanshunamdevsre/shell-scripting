#!/bin/bash
echo "Check disk usage in linux system for /"
disk_size=`df -h | grep -w "/" | awk '{print $5}'| cut -d '%' -f 1`

echo "$disk_size% of disk is filled"

if [ $disk_size -gt 80 ];
then 
	echo "disk is utilized more than 80%, expan disk or delete file soon"
else
	echo "enough disk is available."
fi 