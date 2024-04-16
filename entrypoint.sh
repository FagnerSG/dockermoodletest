#!/bin/bash

if [ ! -e config.php ]; then
    cp /var/www/html/config-dist.php /var/www/html/config.php
    sed -i 's/\$CFG->dbtype    = '\''[^'\'']*'\'';     # mysql, pgsql, mariadb, mssql, or mysqli/\$CFG->dbtype    = '\''pgsql'\'';/' /var/www/html/config.php
    sed -i 's/\$CFG->dbuser    = '\''[^'\'']*'\'';     # your database username/\$CFG->dbuser    = '\''moodle'\'';/' /var/www/html/config.php
    sed -i 's/\$CFG->dbpass    = '\''[^'\'']*'\'';     # your database password/\$CFG->dbpass    = '\''senha'\'';/' /var/www/html/config.php
    sed -i 's/\$CFG->dbhost    = '\''[^'\'']*'\'';     # your database host/\$CFG->dbhost    = '\''db'\'';/' /var/www/html/config.php
    sed -i 's/\$CFG->dbname    = '\''[^'\'']*'\'';     # your database name, eg moodle/\$CFG->dbname    = '\''moodle'\'';/' /var/www/html/config.php
    sed -i 's/\$CFG->wwwroot   = '\''[^'\'']*'\'';     # your www root/\$CFG->wwwroot   = '\''http:\/\/localhost'\'';/' /var/www/html/config.php
    chown www-data:www-data /var/www/html/config.php
fi

sed -i "s/\$CFG->dbhost    = 'localhost'/\$CFG->dbhost    = 'db'/g" /var/www/html/config.php

# Iniciar o serviço do Moodle e Apache
apache2ctl start
service cron start

# Mantém o contêiner em execução
tail -f /dev/null
