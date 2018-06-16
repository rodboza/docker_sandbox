docker stop -t0 dbmq
docker rm dbmq
docker build --no-cache -t mariadb-netcore .
docker run -d --network SQL -p 5000:80 --name dbmq mariadb-netcore


