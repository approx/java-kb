# Cannot determine embedded database driver class for database type NONE

## Troubleshooting

1. Verifique se você forneceu ao Spring Boot informações suficientes para configurar um `DataSource`. Para isso, procure o arquivo `application.properties` (fica geralmente em `src/main/resources`) e adicione as propriedades `spring.datasource.url`, `spring.datasource.driver-class-name`. Exemplo:

   ```properties
   spring.datasource.url=jdbc\:mysql\://localhost/dbname?autoReconnect\=true&useSSL\=false
   spring.datasource.username=
   spring.datasource.password=
   ```
   
# No session repository could be auto configured, check your configuration (session store type is 'null')

Geralmente isso acontece quando você adiciona o Spring Session à sua classpath e não fornece nenhuma forma de armazenar a sessão.

## Troubleshooting
1. Se você ainda não definiu como a sessão será responsável armazenada, defina `spring.session.store-type=none` em seu arquivo `application.properties`;
