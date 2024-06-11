# Company Database

Este projeto cria e gerencia um banco de dados para uma empresa com várias entidades, como funcionários, departamentos, projetos e dependentes. 

## Estrutura do Projeto

- `queries/`: Contém as queries SQL para responder a perguntas específicas sobre o banco de dados.
  - `query1.sql`: Qual o departamento com maior número de pessoas?
  - `query2.sql`: Quais são os departamentos por cidade?
  - `query3.sql`: Relação de empregados por departamento.
  - `view_empregados_por_departamento_localidade.sql`: Número de empregados por departamento e localidade.
  - `view_departamentos_gerentes.sql`: Lista de departamentos e seus gerentes.
  - `view_projetos_maior_numero_empregados.sql`: Projetos com maior número de empregados.
  - `view_projetos_departamentos_gerentes.sql`: Lista de projetos, departamentos e gerentes.
  - `view_empregados_dependentes_gerentes.sql`: Quais empregados possuem dependentes e se são gerentes.

- `sql/`: Contém os scripts SQL para criar o banco de dados, tabelas, índices, views e usuários.
  - `create_database.sql`: Script para criar o banco de dados.
  - `create_tables.sql`: Script para criar as tabelas.
  - `create_indexes.sql`: Script para criar os índices.
  - `create_views.sql`: Script para criar as views. Usa `CREATE OR REPLACE VIEW` para evitar conflitos caso as views já existam.
  - `create_users_permissions.sql`: Script para criar os usuários e definir as permissões.

## Motivos para a Criação das Views

1. **Número de empregados por departamento e localidade (`view_empregados_por_departamento_localidade`)**:
   - **Motivo**: Fornece uma visão clara da distribuição de funcionários por departamento e localidade.

2. **Lista de departamentos e seus gerentes (`view_departamentos_gerentes`)**:
   - **Motivo**: Facilita a identificação dos gerentes de cada departamento, importante para gestão e comunicação.

3. **Projetos com maior número de empregados (`view_projetos_maior_numero_empregados`)**:
   - **Motivo**: Permite identificar quais projetos têm mais funcionários alocados, importante para alocação de recursos e análise de carga de trabalho.

4. **Lista de projetos, departamentos e gerentes (`view_projetos_departamentos_gerentes`)**:
   - **Motivo**: Fornece uma visão integrada dos projetos com seus respectivos departamentos e gerentes, útil para relatórios gerenciais.

5. **Quais empregados possuem dependentes e se são gerentes (`view_empregados_dependentes_gerentes`)**:
   - **Motivo**: Facilita a identificação de empregados que possuem dependentes e se são gerentes, útil para análises de benefícios e hierarquia.

## Definição de Permissões de Acesso

- **Usuário Gerente**: Tem acesso a informações de funcionários e departamentos, além de algumas views específicas.
- **Usuário Employee**: Tem acesso a informações de funcionários e dependentes, além de algumas views específicas.

## Como Utilizar

1. Execute os scripts SQL na seguinte ordem:
   - `create_database.sql`
   - `create_tables.sql`
   - `create_indexes.sql`
   - `create_views.sql`
   - `create_users_permissions.sql`
   
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

Espero que isso ajude a organizar e documentar o seu projeto!
