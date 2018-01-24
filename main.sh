_Password=""
_PathLocal=""
_PathContainer="/tmp/files"
_Volume=""


main()
{
    #criar_container "sqlnode1" "1433" "5022"
    #criar_container "sqlnode2" "1434" "5023"
    #criar_container "sqlnode3" "1435" "5024"
    echo "Aguardandado subida dos containers..."
    #sleep 20
    
    configura_always_on "sqlnode1"
    configura_always_on "sqlnode2"
    configura_always_on "sqlnode3"
    sleep 5
    
    reset_container "sqlnode1"
    reset_container "sqlnode2"
    reset_container "sqlnode3"
    echo "Aguardandado subida dos containers..."
    sleep 30

    config_master "sqlnode1"    
    config_slave "sqlnode2"
    config_slave "sqlnode3"
    
    exec_script "sqlnode1"  "script_4.sql"
    exec_script "sqlnode2"  "script_5.sql"
    exec_script "sqlnode3"  "script_5.sql"
    exec_script "sqlnode1"  "script_6.sql"
    echo "Limpando os arquivos..."
    rm -r certs/
}


config_master ()
{
    Container=$1
    exec_script ${Container}  "script_1.sql"
    exec_shell_script ${Container} "copy_1.sh" "Copiando os certificados"
    exec_script ${Container}  "script_2.sql"
}

config_slave ()
{
    Container=$1
    exec_shell_script ${Container} "copy_2.sh" "Copiando e registrando os certificados"
    exec_script ${Container}  "script_3.sql"
}

exec_shell_script()
{
    Container=$1
    ShellScript=$2
    MessageLog=$3
    echo "Excecutando em ${Container} o Shell Script ${ShellScript} - ${MessageLog}..."
    docker exec -it ${Container} /bin/bash ${_PathContainer}/scripts/${ShellScript} ${_PathContainer}
    #exit
    sleep 5
}

configura_always_on()
{
    Container=$1
    echo "Aplicando as configurações no container..."
    docker exec -it ${Container} /opt/mssql/bin/mssql-conf set hadr.hadrenabled  1
}

reset_container()
{
    Container=$1
    echo "Resetando o container para aplicar as configurações..."
    docker stop -t 0 ${Container}
    docker start ${Container}
}

criar_container()
{
    Container=$1
    PortaSql=$2
    PortaAws=$3
    echo "Criando a o container ${Container}..."
    docker stop -t 0 ${Container}
    docker rm ${Container}
    docker run --name ${Container} -h=${Container} -d -v ${_PathLocal}:${_PathContainer} -e 'ACCEPT_EULA=Y' -e SA_PASSWORD=${_Password} -p ${PortaSql}:1433 -p ${PortaAws}:5022 --network SQL microsoft/mssql-server-linux:2017-latest
}

exec_script ()
{
    Container=$1
    Script=$2
    echo "Rodando em ${Container} o script  ${Script}..."
    docker exec -it ${Container}  /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P ${_Password} -d master -i ${_PathContainer}/scripts/${Script}
    sleep 10
}

#if(n $1);
#then
    _Password="P@ssw0rd"
    _PathLocal=${PWD}
    _Volume="$_PathLocal:$_PathContainer"
    echo ${_Volume}
    echo ${PWD}
    
    main
#else
#    echo ""
#    echo "main PASSWORD"
#    echo ""
#fi

