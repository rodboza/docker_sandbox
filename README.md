# Docker SandBox Master

<p>Master - Em desenvolvimento
<p>v1.0 - Nessa versão ao rodar o script Main.sh serão criados 4 containers, sendo três Sql Servers ligados com o AwaysOn e mais um que é uma aplicação Asp .Net core que faz acesso aos containers SQL.

Desenho da Arquitetura:
![Desenho da Arquitetura](https://raw.githubusercontent.com/rodboza/docker_sqlserver/master/arquitetura.png)


Para executar você precisa de uma máquina Linux com o Docker instalado.

No terminal digite:

``` sh
sudo su
git clone https://github.com/rodboza/docker_sqlserver.git
cd docker_sqlserver
./main.sh
```

