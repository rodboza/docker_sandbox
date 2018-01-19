#copy.sh
_PathContainer=$1
mkdir ${_PathContainer}/certs
cp /var/opt/mssql/data/dbm_certificate.* ${_PathContainer}/certs


