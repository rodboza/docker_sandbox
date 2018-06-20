docker stop -t0 dbmq1 dbmq2 dbmq3
docker rm dbmq1 dbmq2 dbmq3
docker build -t mariadb-netcore .
docker run -d -v ${PWD}/50-server.cnf:/etc/mysql/mariadb.conf.d/50-server.cnf --network SQL -p 3307:3306 -p 5001:80 -h dbmq1 --name dbmq1 mariadb-netcore
docker run -d -v ${PWD}/50-server.cnf:/etc/mysql/mariadb.conf.d/50-server.cnf --network SQL -p 3308:3306 -p 5002:80 -h dbmq2 --name dbmq2 mariadb-netcore
docker run -d -v ${PWD}/50-server.cnf:/etc/mysql/mariadb.conf.d/50-server.cnf --network SQL -p 3309:3306 -p 5003:80 -h dbmq3 --name dbmq3 mariadb-netcore


