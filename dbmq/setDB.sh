#! /bin/bash

service mysql start
sed -i "s/.*bind-address.*/bind-address = 0.0.0.0/" /etc/mysql/mariadb.cnf
service mysql restart
mysql -u root --password=chocolate < /pipeline/dbcmds

#while(true)
#do
#sleep 100;
#echo "Paused";
#done
