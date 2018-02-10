FROM microsoft/aspnetcore-build AS build-env
WORKDIR /app

# copy csproj and restore as distinct layers
COPY *.csproj ./
RUN dotnet restore

# copy everything else and build
COPY . ./
RUN dotnet publish -c Release -o out

# build runtime image
FROM microsoft/aspnetcore
COPY setDB.sh /pipeline/
COPY dbcmds /pipeline/
RUN echo "mysql-server mysql-server/root_password password chocolate" | debconf-set-selections
RUN echo "mysql-server mysql-server/root_password_again password chocolate" | debconf-set-selections
RUN apt-get update && apt-get -y upgrade && apt-get -y install mysql-server && apt-get -y install nano vim
RUN /pipeline/setDB.sh
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT ["dotnet", "dbmq.dll"]
