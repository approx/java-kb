# Cannot determine embedded database driver class for database type NONE

## Troubleshooting

1. Verifique se você forneceu ao Spring Boot informações suficientes para configurar um `DataSource`. Para isso, procure o arquivo `application.properties` (fica geralmente em `src/main/resources`) e adicione as propriedades `spring.datasource.url`, `spring.datasource.driver-class-name`. Exemplo:

   ```properties
   spring.datasource.url=jdbc\:mysql\://localhost/dbname?autoReconnect\=true&useSSL\=false
   spring.datasource.username=
   spring.datasource.password=
   ```
   
