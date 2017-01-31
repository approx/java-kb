# java.net.BindException: Address already in use: bind

Isso pode acontecer quando há outro servidor de aplicação utilizando a mesma porta reservada para o Spring Boot.

# Cenários típicos

* Já existe o Apache Tomcat instalado e configurado para que seu serviço inicialize junto com o computador;

# Troubleshooting

1. Verifique se a porta a ser utilizada pelo servidor de aplicação não está sendo usada.
