docker stop -t0 dbmq1 dbmq2 dbmq3
docker rm dbmq1 dbmq2 dbmq3
docker build -t mariadb-netcore .
docker run -d --network SQL -p 5001:80 --name dbmq1 mariadb-netcore
docker run -d --network SQL -p 5002:80 --name dbmq2 mariadb-netcore
docker run -d --network SQL -p 5003:80 --name dbmq3 mariadb-netcore


