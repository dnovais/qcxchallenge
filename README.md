
# <img src="https://odin.qconcursos.com/packs/images/logo/qc-47196578.svg" alt="qcx" width="24" /> Desafio QConcursos
  
O Qconcursos é plataforma online de resolução de questões de concursos e cursos, voltada para apoiar os estudantes a alcançarem a aprovação em concursos públicos e a evoluírem na sua vida profissional por meio da educação. Estamos em constante evolução e justamente por isso queremos evoluir o nosso serviço de buscas.

## Sobre o desafio

Você vai ser responsável por modelar e desenvolver esse serviço utilizando as bibliotecas/frameworks que achar que mais convenientes para a solução. Tenha em mente de que temos mais de 300 mil clientes diários então escala é algo imprescindível por aqui. Para isso você deve ler os arquivos json neste repositório e baseado nos dados contidos criar os seguintes modelos de busca:

**Disciplinas com questões mais quentes:**  Listar as disciplinas onde as questões foram as mais acessadas nas ultimas 24H  
**Mais acessadas por periodo:**  Listar as questões mais acessadas por semana/mês/ano
## Executando o projeto

O projeto esta preparado para o uso do docker e caso prefira ou precise ele está pronto para rodar sem o uso do docker também.

### Usando o Docker

1. Criar o banco de dados
	```
	docker-compose run --rm app bundle exec rails db:create
	```
2. Executar as migrações
	```
	docker-compose run --rm app bundle exec rails db:migrate
	```
3. Popular o banco de dados
	```
	docker-compose run --rm app bundle exec rails db:seed
	```
4. Instalar gems e dependências
	```
	docker-compose run --rm app bundle exec bundle installg
	```
	```
	docker-compose run --rm app bundle exec yarn install
	```
5. Executar os testes
	```
	docker-compose run --rm app bundle exec rspec
	```
6. Executar a aplicação
	```
	docker-compose up -d
	```

### Sem o uso do <s>Docker</s>

 -->   **Pré-requisitos**

- Ruby - 2.7.1

- Rails - 6.0.3

- PostgreSQL

 -->   **Passo a passo**
1. Criar o banco de dados
	```
	rails db:create
	```
2. Executar as migrações
	```
	rails db:migrate
	```
3. Popular o banco de dados
	```
	rails db:seed
	```
4. Instalar gems e dependências
	```
	bundle install
	```
	```
	yarn install
	```
5. Executar os testes
	```
	rspec
	```
6. Executar a aplicação
	```
	rails server
	```

### Para acessar o projeto no navegador

```
localhost:3000
```

## Documentação
Para este projeto foi fornecido os dados sobre as questões e acessos diários de cada questão no formato json. Nosso objetivo foi modelar o projeto para que fosse possível consumir estes dados e fornece-los aos clientes.

### Cenário e hipóteses
Para cada questão tem-se a preocupação de monitorar os acessos diários e para isso no projeto principal a cada acesso é disparado um método que atualiza a coluna de acesso diário deixando-a sempre atualizada e facilitando as consultas no banco de dados. Por este motivo no arquivo exportado em JSON (questions.json) temos a informação **daily_access**.

### Modelagem do banco de dados

![alt modelagem do banco](https://github.com/dnovais/qcxchallenge/raw/master/app/assets/images/qcx_diagram.png)

### Seeds
Para consumir os dados foi implementado a importação através do seeds, onde tive a preocupação de rodar em paralelismo (utilizando a gem 'parallel') para que os dados possam ser importados com mais velocidade.

### Query Objects
Quando precisamos utilizar queries mais complexas e ou utilizar uma grande quantidade de scopes para compor queries, acabamos deixando nossos models complexos e quebrando vários princípios como da responsabilidade única e o dry (Don't repeat yourself).

O Query Objects é padrão com o objetivo de eliminar a complexidade das queries em nossos models e deixa-los com um código mais enxuto e legível. Dessa forma conseguimos isolar uma consulta específica que implementa apenas uma regra de lógica de negócios. E tudo isso sem perder o poder de estender, herdar consultas e utilizar scopes aninhados.

No projeto foi criado os 2 query objects:

- app/queries/questions/hotter_questions_query.rb
- app/queries/questions/most_accessed_query.rb

## Próximos passos e melhorias
-  Adicionar **Low**-**level caching** para otimizar o carregamento das questões;
- Melhorar a experiência do usuário com um layout melhor;
- Criar e utilizar helpers para facilitar e melhorar nossas views;
- Podemos otimizar nossa infra de forma horizontal, ou seja, aumentar a quantidade de servidores e utilizar o melhor do load balance e conseguir otimizar o máximo da performance e entregar a melhor experiência para nossos clientes;
- Podemos também otimizar de forma vertical caso seja mais viável, ou seja, aumentar o poder de processamento dos servidores ja utilizados;

## Contato
Para tirar qualquer dúvida ou caso queira entrar em contato:
- Email: contato@diegonovais.com.br