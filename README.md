# Docker SandBox (Master)

Para executar você precisa de uma máquina Linux com o Docker instalado.

No terminal digite:

``` sh
sudo su
git clone https://github.com/rodboza/docker_sandbox.git
git checkout master
cd docker_sandbox
./main.sh
```


# Desenho da Arquitetura:<p>
![Desenho da Arquitetura](https://raw.githubusercontent.com/rodboza/docker_sandbox/master/arquitetura.png)


# Change log:<p>
<p>Master - Em Desenvolvimento - Fazendo a atualização do SQL via Tópico do ActiveMQ, e se der troca dos SQL Servers por MySql para deixar a sulução mais leve.
<p>v3.0 - Inclusão de uma conexão direta no node Primary do Always On para permitir a gravação de dados.
<p>v2.0 - Incluido um LoadBalance para acionar um dos nodes SQL ativo, com isso a aplicação só fuciona em modo ReadOnly, pois com o Always On ligado somente o node Primary pode realizar gravações. Para as próximas versões eu vou montar uma conexão direta ao node Primary para disponibilizar a gravação.
<p>v1.0 - Versão inicial, ao rodar o script Main.sh serão criados 4 containers, sendo três Sql Servers ligados com o AwaysOn e mais um que é uma aplicação Asp .Net core que faz acesso aos containers SQL.


# Referências
Exemplo aplicação .Net com Publish/Subscribe com ActiveMQ : <p/>
https://remark.wordpress.com/articles/publish-subscribe-with-activemq-and-nms/

<p/>https://stackoverflow.com/questions/19933071/activemq-no-topic-messages-received-from-durableconsumer

Nuget ActiveMQ NetCore: <p/>
https://www.nuget.org/packages/Apache.NMS.ActiveMQ.NetCore/
Nuget ActiveMQ NetCore: <p/>
https://www.nuget.org/packages/Apache.NMS.NetCore/

<p/>https://github.com/asseco-see/dotnet-broker-wrapper

Instalação do MySQL no ubuntu: <p/>
https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-16-04

Sample MVCMovie: <p/>
https://github.com/aspnet/Docs/tree/master/aspnetcore/tutorials/first-mvc-app-xplat/start-mvc/sample/MvcMovie

Criar um aplicativo Web com o ASP.NET Core MVC: <p/>
https://docs.microsoft.com/pt-br/aspnet/core/tutorials/first-mvc-app/

Criando APIs Web : <p/>
https://docs.microsoft.com/pt-br/aspnet/core/mvc/web-api/
<p>
<p>
Comandos para adicionar referencias no projeto NetCore para o ActiveMQ
  
``` sh
dotnet add package Apache.NMS.NetCore --version 1.7.1
dotnet add package Apache.NMS.ActiveMQ.NetCore --version 1.7.2
```
