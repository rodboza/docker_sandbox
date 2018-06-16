docker stop -t0 dbmq
docker rm dbmq
docker build -t mariadb-netcore -f suptst.DF .
docker run -d --network SQL -p 5000:80 --name dbmq mariadb-netcore


