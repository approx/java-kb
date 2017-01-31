# java.net.BindException: Address already in use: bind

Isso pode acontecer quando há outro servidor de aplicação utilizando a mesma porta reservada para o Spring Boot.

# Cenários típicos

* Já existe o Apache Tomcat instalado e configurado para que seu serviço inicialize junto com o computador;

# Troubleshooting

* Verifique se a porta a ser utilizada pelo servidor de aplicação não está sendo usada.

# Port 8080 required by Pivotal tc Server Developer Edition is already in use

Isso acontece quando há outro servidor utilizando a mesma porta reservada para o Pivotal Server.

## Cenários típicos
* Já existe o Apache Tomcat instalado e configurado para que seu serviço inicialize junto com o computador;

## Troubleshooting
1. Pare todos os servidores integrados à IDE que porventura estejam rodando. Se estiver utilizando o Tomcat no Windows, por exemplo, procure pelo aplicativo "Configure Tomcat" e clique no botão "Stop".

