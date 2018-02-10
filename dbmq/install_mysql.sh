apt-get update -y
echo "mysql-server-5.7 mysql-server/root_password password admin" | debconf-set-selections
echo "mysql-server-5.7 mysql-server/root_password_again password admin" | debconf-set-selections
apt-get -y install mysql-server-5.7
