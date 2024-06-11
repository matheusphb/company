# Company Database

Este projeto cria e gerencia um banco de dados para uma empresa com várias entidades, como funcionários, departamentos, projetos e dependentes. 

## Estrutura do Projeto

- `queries/`: Contém as queries SQL para responder a perguntas específicas sobre o banco de dados.
  - `query1.sql`: Qual o departamento com maior número de pessoas?
  - `query2.sql`: Quais são os departamentos por cidade?
  - `query3.sql`: Relação de empregados por departamento.

- `sql/`: Contém os scripts SQL para criar o banco de dados, tabelas e índices.
  - `create_database.sql`: Script para criar o banco de dados.
  - `create_tables.sql`: Script para criar as tabelas.
  - `create_indexes.sql`: Script para criar os índices.

## Motivos para a Criação dos Índices

1. **Índice na coluna Dno da tabela Funcionario (`idx_funcionario_departamento`)**:
   - **Motivo**: Este índice otimiza consultas que filtram funcionários por departamento, como a query que busca o departamento com maior número de pessoas.
   
2. **Índice na coluna Dlocation da tabela LocalizacoesDepartamento (`idx_localizacoesdepartamento_cidade`)**:
   - **Motivo**: Este índice otimiza consultas que filtram departamentos por localização, facilitando a recuperação rápida de dados sobre onde cada departamento está localizado.

## Como Utilizar

1. Execute os scripts SQL na seguinte ordem:
   - `create_database.sql`
   - `create_tables.sql`
   - `create_indexes.sql`
   
2. Use as queries na pasta `queries/` para obter as informações necessárias.

## Descrição do Banco de Dados

O banco de dados contém as seguintes tabelas:

- **Departamento**: Contém informações sobre os departamentos da empresa.
- **LocalizacoesDepartamento**: Contém informações sobre as localizações dos departamentos.
- **Funcionario**: Contém informações sobre os funcionários da empresa.
- **Projeto**: Contém informações sobre os projetos da empresa.
- **TrabalhaEm**: Contém informações sobre a relação entre funcionários e projetos.
- **Dependente**: Contém informações sobre os dependentes dos funcionários.

Cada tabela possui colunas específicas que armazenam os dados relevantes, e as relações entre as tabelas são estabelecidas por chaves estrangeiras.
