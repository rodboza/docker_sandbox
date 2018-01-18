

main()
{
   docker stop -t 0 sqlnode1 && docker rm sqlnode1 
   docker run --name sqlnode1 -d -v /home/rodboza/SqlFiles:/tmp/rodboza \
          -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=Rodrigo0' -p 1433:1433 -p 5022:5022 \
          --network SQL \
          microsoft/mssql-server-linux:2017-latest
   docker exec -it sqlnode1 /opt/mssql/bin/mssql-conf set hadr.hadrenabled  1
   docker stop -t 0 sqlnode1 && docker start sqlnode1

  esac
}


main
