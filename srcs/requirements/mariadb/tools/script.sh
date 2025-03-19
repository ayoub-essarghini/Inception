#!/bin/sh

sed -ie 's/#bind-address/bind-address/g' /etc/my.cnf.d/mariadb-server.cnf
sed -ie 's/skip-networking/#skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf

if [ ! -d /var/lib/mysql/${DB_NAME} ];
	then
		echo "Create Data Base"
		mysql_install_db --user=${DB_USER} --datadir=/var/lib/mysql
		/usr/share/mariadb/mysql.server start
		mysql --user=root <<_EOF_
		ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';
		DELETE FROM mysql.user WHERE User='';
		DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
		DROP DATABASE IF EXISTS test;
		DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
		CREATE DATABASE IF NOT EXISTS ${DB_NAME};
		GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
		FLUSH PRIVILEGES;
_EOF_
		mysqladmin --user=root --password=$DB_ROOT_PASSWORD shutdown
	else
		echo "Database is already installed and configured !"
fi

echo "Starting up mariadb's server..."

exec "$@"
