
FROM microsoft/aspnetcore-build AS build-env
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore

# copy everything else and build
COPY . ./
RUN dotnet publish -c Release -o out







FROM microsoft/aspnetcore:2.0



RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y mariadb-server mariadb-client supervisor \
    && mkdir -p /var/log/supervisor

# Initialize squash development database
ENV user root


RUN /etc/init.d/mysql start \
    && mysql -u ${user} -e "CREATE DATABASE qadb" \
    && mysql -u ${user} -e "create user 'teste'@'%' identified by 'teste'" \
    && mysql -u ${user} -e "grant all privileges on *.* to 'teste'@'%' with grant option" \
    && mysql -u ${user} qadb -e "create table qa_msgs (id int AUTO_INCREMENT, data datetime default now(), host varchar(50), msg VARCHAR(65000), KEY (id) ) " 
#    && mysql -u ${user} -e ""





#COPY setDB.sh /pipeline/
#COPY dbcmds /pipeline/
#RUN /pipeline/setDB.sh
WORKDIR /app
COPY --from=build-env /app/out .
#ENTRYPOINT ["dotnet", "dbmq.dll"]
#CMD ["dotnet","dbmq.dll"]
#CMD ["/usr/local/bin/docker-entrypoint.sh","mysql"]

ADD supervisor.conf /etc/supervisor/conf.d/supervisord.conf 
ENTRYPOINT ["/usr/bin/supervisord","-c","/etc/supervisor/conf.d/supervisord.conf"]

