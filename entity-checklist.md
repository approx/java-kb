# Checklist para criação de ```@Entity``` com JPA e Validação

## Banco de dados

* Se seu banco de dados possui uma quantidade razoável de tabelas com colunas "builtin", crie uma ```abstract class``` para guardar a variável, getter e setter de forma que as classes ```@Entity``` herdam dela;
* Se seu banco de dados possui uma quantidade razoável de tabelas auditáveis (que armazenarão timestamps de criação e atualização), crie uma ```abstract class``` para guardar as colunas. Tente nomeá-las como ```created_at``` e ```updated_at```;

## Tabela

1. Sempre utilize a anotação ```@Table``` e informe seu ```name```;
2. Para cada variável relacionada a uma coluna, insira a anotação ```@Column``` e defina sempre o ```name``` da coluna;
3. Para cada ```@Column``` siga a ordem: variável com anotações de validação, getter com anotações de persistência e setter;
4. Procure sempre definir, ainda na anotação ```@Column``` se aquela coluna é ou não ```insertable```, ```nullable``` e ```updatable```. Para respeitar o code style do Java e do Spring, coloque espaços entre o símbolo ```=```;
5. Se a coluna possui um valor padrão, informe este valor na variável privada;
6. Se a tabela possui alguma anotação ```@OneToMany```, crie um construtor vazio para ela.

## Colunas

### Chaves de identificação
* Tente sempre nomear a coluna e a variável como ```id```;
* Para chaves primárias numéricas, utilize ```Integer``` ou ```Long``` (dependendo da dimensão do sistema). A decisão desse tipo afetará a implementação das interfaces de repositórios que herdam de ```CrudRepository```, ```JpaRepository``` ou ```PagingAndSortingRepository```;
* Para chaves primárias numéricas geradas por autoincremento, certifique-se de inserir ```@Min(1)``` nas anotações de validação e ```@GeneratedValue``` nas anotações de persistência;
* Se quiser utilizar chaves primárias alfanuméricas, certifique-se de que elas tenham um length pequeno, para não trazer problemas de desempenho. Senão, é melhor criar uma chave numérica gerada por autoincremento;
* Se for obrigatório ou viável utilizar chaves primárias ```String``` não se esqueça de definir o ```@Size(max)``` com o tamanho máximo de caracteres da chave. Isso evita inconsistências.

### Nome completo
Strings de 126 caracteres armazenam a maioria dos nomes de pessoas e organizações no banco de dados.

* Tipo da variável privada: ```String```;
* Anotações de persistência recomendadas: ```@Column(insertable = true, nullable = false, unique = false, updatable = true)```;
* Anotações de validação: ```@Size(max = 126)```;
* Tipo no MySQL: ```VARCHAR(126)```
* Equivalente no Eloquent: ```$table->string('name', 126);```

### Nome de usuário (para login)
Strings de 14 caracteres são suficientes para a maioria dos sistemas.

* Tipo de variável privada: ```String```;
* Anotações de persistência recomendadas: ```@Column(insertable = true, unique = true, updatable = false)```
* Anotações de validação ```@Size(max = 14)```;
* Tipo no MySQL: ```VARCHAR(14)```
* Equivalente no Eloquent: ```$table->string('login', 14);```

## E-mail (para login e outros usos)
De acordo com especificações RFC, um e-mail pode ter no mínimo 3 e no máximo 254 caracteres.

* Tipo de variável privada: ```String```;
* Anotações de persistência recomendadas: ```@Column(insertable = true, unique = true, updatable = true)```
* Anotações de validação: ```@Size(min = 3, max = 254)```
* Tipo no MySQL: ```VARCHAR(254)```
* Eloquent: ```$table->string('email', 254);```

## Senha criptografada
A quantidade máxima de caracteres depende da criptografia usada. 60 é um bom número para bcrpyt, por exemplo.

* Tipo de variável privada: ```String```;
* Anotações de persistência recomendadas: ```@Column(insertable = true, nullable = false, unique = false, updatable = true)```
* Anotações de validação: ```@Size(max = 60)
* Tipo no MySQL: ```VARCHAR(60)```
* Eloquent: ```$table->string('password', 60);```
