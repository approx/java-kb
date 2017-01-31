# Editing ```java.util.zip.ZipException```: invalid LOC header (bad signature)

Este problema costuma acontecer quando algum pacote jar utilizado pelo projeto está corrompido.

## Cenários
* Há casos em que, após migrar o ambiente de desenvolvimento de uma máquina para outra, há uma falha ao tentar ler o arquivo de manifesto de JARs como o `hibernate-core-5.0.11.Final.jar` (em `%USERPROFILE%/.m2/repository/org/hibernate/hibernate-core/5.0.11.Final/`)

## Troubleshooting

1. Verifique se a variável de ambiente %JAVA_HOME% foi definida;
2. Utilize [este script](https://github.com/approx/java-troubleshooting/blob/master/trbl-invalid-jar-files.bat) de linha de comando para verificar se o arquivo realmente é inválido. O script basicamente acessa diretórios comuns de JARs e verifica-os usando o seguinte comando:

   ```shell
   $ jar tf hibernate-core-5.0.11.Final.jar
   ```
3. Force a atualização de dependências do Maven. Clique com o botão direito no seu projeto, escolha Maven > Update project. Marque a caixa "Force Update of Snapshots/Releases" e tente rodá-lo novamente;
4. Tente limpar o cache do Spring. Clique com o botão direito no seu projeto, escolha Spring Tools > Reset internal caches.

# Source not found for org.hibernate...

Exemplos de itens não encontrados:

```java
org.hibernate.annotations.CreationTimestamp
org.hibernate.annotations.UpdateTimestamp
org.hibernate.cfg.Configuration
org.hibernate.HibernateException
org.hibernate.SessionFactory
```

1. Verifique se o arquivo `hibernate.cfg.xml` está num local adequado. Geralmente em `src/hibernate.cfg.xml`. Verifique se ele pode ser visto na raiz do classplath de sua aplicação.
2. Verifique se a senha de conexão ao banco de dados no arquivo de configurações do Hibernate (`hibernate.cfg.xml`) está correta

   ```xml
   <property name="hibernate.connection.password"></property>
   ```
   
3. Verifique se o Maven está carregando o pacote do hibernate. Seu arquivo `pom.xml` deve ter pelo menos as seguintes dependências:

    ```xml
    <dependency>
      <groupId>org.hibernate</groupId>
      <artifactId>hibernate-core</artifactId>
      <scope>default</scope>
    </dependency>
    <dependency>
      <groupId>org.springframework</groupId>
      <artifactId>spring-jdbc</artifactId>
      <scope>default</scope>
     </dependency>
     ```

4. *Solução botão-vermelho*: Desinstale a IDE, reinstale-a e importe seu projeto novamente.
