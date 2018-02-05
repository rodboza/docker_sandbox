# Docker SandBox Master

<p>v3.0 - Inclusão de uma conexão direta no node Primary do Always On para permitir a gravação de dados.
<p>v2.0 - Incluido um LoadBalance para acionar um dos nodes SQL ativo, com isso a aplicação só fuciona em modo ReadOnly, pois com o Always On ligado somente o node Primary pode realizar gravações. Para as próximas versões eu vou montar uma conexão direta ao node Primary para disponibilizar a gravação.
<p>v1.0 - Versão inicial, ao rodar o script Main.sh serão criados 4 containers, sendo três Sql Servers ligados com o AwaysOn e mais um que é uma aplicação Asp .Net core que faz acesso aos containers SQL.

Desenho da Arquitetura:<p>
![Desenho da Arquitetura](https://raw.githubusercontent.com/rodboza/docker_sqlserver/v3.0/arquitetura.png)


Para executar você precisa de uma máquina Linux com o Docker instalado.

No terminal digite:

``` sh
sudo su
git clone https://github.com/rodboza/docker_sqlserver.git
git checkout v3.0
cd docker_sqlserver
./main.sh
```

