docker stop -t 0 activemq
docker rm activemq 
docker run -h activemq --name='activemq' -d -v ${PWD}/scripts/activemq.xml:/opt/activemq/conf/activemq.xml -e 'ACTIVEMQ_MIN_MEMORY=512'  -e 'ACTIVEMQ_MAX_MEMORY=1024' -p 8161:8161 -p 61616:61616 -p 61613:61613 -P webcenter/activemq:latest
#docker run -h activemq --name='activemq' -d -e 'ACTIVEMQ_MIN_MEMORY=512'  -e 'ACTIVEMQ_MAX_MEMORY=1024' -p 8161:8161 -p 61616:61616 -p 61613:61613 -P webcenter/activemq:latest
