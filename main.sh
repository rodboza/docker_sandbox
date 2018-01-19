_Password=""
_PathLocal=""
_PathContainer="/tmp/files"

main()
{
    echo "Resetando o container..."
    docker stop -t 0 sqlnode1
    docker rm sqlnode1
    echo "Criando a o container..."
    docker run --name sqlnode1 -d -v $(_PathLocal):$(_PathContainer) \
            -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=$(_Password)' -p 1433:1433 -p 5022:5022 \
            --network SQL \
            microsoft/mssql-server-linux:2017-latest
    echo "Aguardandado subida do container..."
    sleep 10
    echo "Aplicando as configurações no container..."
    docker exec -it sqlnode1 /opt/mssql/bin/mssql-conf set hadr.hadrenabled  1
    echo "Resetando o container para aplicar as configurações..."
    docker stop -t 0 sqlnode1
    docker start sqlnode1
    echo "Aguardandado subida do container..."
    sleep 10
    echo "Rodando scrip1..."
    docker exec -it sqlnode1 /opt/mssql-tools/bin/sqlcmd \
            -S localhost -U sa -P $(_Password) -d master -i $(_PathContainer)/scripts/script_1.sql
    echo "Copiando os certificados..."
    docker exec -it sqlnode1 $(_PathContainer)/scripts/copy.sh $(_PathContainer)
    echo "Rodando scrip2..."
    docker exec -it sqlnode1 /opt/mssql-tools/bin/sqlcmd \
            -S localhost -U sa -P $(_Password) -d master -i $(_PathContainer)/scripts/script_2.sql
    echo "Rodando scrip3..."
    docker exec -it sqlnode1 /opt/mssql-tools/bin/sqlcmd \
            -S localhost -U sa -P $(_Password) -d master -i $(_PathContainer)/scripts/script_2.sql

}

#if(n $1);
#then
    _Password="P@ssw0rd" #$1
    _PathLocal=pwd
    main
#else
#    echo ""
#    echo "main PASSWORD"
#    echo ""
#fi

