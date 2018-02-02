FROM microsoft/mssql-server-linux:2017-latest
ENV ACCEPT_EULA=Y
#ENV SA_PASSWORD=P@ssw0rd
RUN /opt/mssql/bin/mssql-conf set hadr.hadrenabled  1

