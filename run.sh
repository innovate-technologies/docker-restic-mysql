#!/bin/sh

mysqldump -h "$MYSQL_HOST" -u "$MYSQL_USER" --password="$MYSQL_PASSWORD" --all-databases --single-transaction --quick --lock-tables=false  | gzip | restic backup --stdin --stdin-filename dump.sql.gz 