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
6. Saiba como proceder para diversos tipos de @Id (chaves de identificação):
   * tente sempre nomear a coluna e a variável como ```id```;
   * para chaves primárias numéricas, utilize ```Integer``` ou ```Long``` (dependendo da dimensão do sistema). A decisão desse tipo afetará a implementação das interfaces de repositórios que herdam de ```CrudRepository```, ```JpaRepository``` ou ```PagingAndSortingRepository```;
   * para chaves primárias numéricas geradas por autoincremento, certifique-se de inserir ```@Min(1)``` nas anotações de validação e ```@GeneratedValue``` nas anotações de persistência;
   * se quiser utilizar chaves primárias alfanuméricas, certifique-se de que elas tenham um length pequeno, para não trazer problemas de desempenho. Senão, é melhor criar uma chave numérica gerada por autoincremento;
   * se for obrigatório ou viável utilizar chaves primárias ```String``` não se esqueça de definir o ```@Size(max)``` com o tamanho máximo de caracteres da chave. Isso evita inconsistências.
