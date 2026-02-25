#!/bin/bash
echo "Check apache service"

if systemctl is-active --quiet apache2
then
	echo "Apache is running."
else
	echo "Apache is not running"
fi

echo "Check MariaDB service"
# apache_service="apache2"
# mariadb_service="mariadb"

if systemctl is-active --quiet mariadb
then
	echo "MariaDB is running."
else
	echo "MariaDB is not running"
fi
