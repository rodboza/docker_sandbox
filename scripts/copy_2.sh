#copy.sh
_PathContainer=$1
cp ${_PathContainer}/certs/*.* /var/opt/mssql/data
chown root:root /var/opt/mssql/data/dbm_certificate.*
