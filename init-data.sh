#!/bin/bash
set -e;

if [ -n "${MYSQL_NON_ROOT_USER:-}" ] && [ -n "${MYSQL_NON_ROOT_PASSWORD:-}" ]; then
    mysql -v -u"$MYSQL_USER" -p"$MYSQL_PASSWORD" -e "
        CREATE USER IF NOT EXISTS '${MYSQL_NON_ROOT_USER}'@'%' IDENTIFIED BY '${MYSQL_NON_ROOT_PASSWORD}';
        GRANT ALL PRIVILEGES ON ${MYSQL_DB}.* TO '${MYSQL_NON_ROOT_USER}'@'%';
        FLUSH PRIVILEGES;
    "
else
	echo "SETUP INFO: No Environment variables given!"
fi
