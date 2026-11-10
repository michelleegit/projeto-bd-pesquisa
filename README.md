
# Projeto de Banco de Dados — Gestão de Pesquisa

## Sobre o projeto

Este projeto consiste no desenvolvimento de um banco de dados relacional para representar e gerenciar informações de um ambiente de pesquisa acadêmica.

A estrutura contempla o gerenciamento de pessoas, pesquisadores, alunos, professores, projetos de pesquisa, experimentos, amostras, equipamentos, laboratórios, eventos e financiadores.

O desenvolvimento abrange as etapas de modelagem conceitual, estruturação do modelo relacional e implementação utilizando PostgreSQL.

## Objetivos

Desenvolver um banco de dados capaz de representar as relações e regras de negócio de um ambiente de pesquisa, aplicando conceitos de modelagem de dados e implementação de bancos de dados relacionais.

## Tecnologias utilizadas

- **PostgreSQL:** Sistema gerenciador de banco de dados.
- **SQL:** Linguagem utilizada para definição, manipulação e consulta dos dados.
- **PL/pgSQL:** Linguagem utilizada na implementação de funções e triggers.

## Modelagem do banco de dados

A modelagem conceitual foi desenvolvida por meio de um Diagrama Entidade-Relacionamento (DER), representando as entidades, seus atributos e os relacionamentos do sistema.

A partir dessa modelagem, foi desenvolvido o modelo relacional, com definição de tabelas, chaves primárias, chaves estrangeiras e restrições de integridade.

**Diagrama Entidade-Relacionamento:**

[Visualizar diagrama completo (PDF)](docs/DiagramaCorrigido%20-%20apreciado.pdf)

## Implementação

A implementação do banco de dados contempla:

- Criação e estruturação de tabelas e relacionamentos.
- Definição de chaves primárias e estrangeiras.
- Aplicação de restrições de integridade (`PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE` e `CHECK`).
- Utilização de relacionamentos para representar associações entre entidades.
- Desenvolvimento de funções e triggers em PL/pgSQL para validação de regras de negócio.
- Criação de views para disponibilização de informações derivadas.
- Inserção de dados para testes e validação da estrutura.

### Funções e Triggers

Foram implementadas regras de validação para:

- Impedir que uma mesma pessoa seja cadastrada simultaneamente como professor e aluno.
- Validar a correspondência entre o tipo de pesquisador e seu respectivo cadastro como professor ou aluno.

### Views

Foram desenvolvidas duas views:

- **Evento_Capacidade_Status:** apresenta a quantidade de participantes associados a um evento em relação à capacidade do laboratório onde ele ocorre.
- **Aluno_Com_Aniversario:** identifica se o aniversário de cada aluno corresponde à data atual.

## Estrutura do repositório

```text
projeto-bd-pesquisa/
│
├── docs/
│   └── DiagramaCorrigido - apreciado.pdf
│
├── sql/
│   ├── 00_reset.sql
│   ├── 01_ddl_tabelas.sql
│   ├── 02_funcoes_triggers.sql
│   ├── 03_views.sql
│   └── 04_dados.sql
│
└── README.md
```

## Como executar

### Pré-requisitos

- PostgreSQL instalado.
- Cliente `psql` disponível no terminal.

### 1. Criar o banco de dados

No terminal, execute:

```bash
createdb -U postgres projeto_bd_pesquisa
```

### 2. Executar os scripts SQL

Na raiz do projeto, execute os arquivos na seguinte ordem:

```bash
psql -U postgres -d projeto_bd_pesquisa -f sql/01_ddl_tabelas.sql

psql -U postgres -d projeto_bd_pesquisa -f sql/02_funcoes_triggers.sql

psql -U postgres -d projeto_bd_pesquisa -f sql/03_views.sql

psql -U postgres -d projeto_bd_pesquisa -f sql/04_dados.sql
```

**Observação:** substitua `postgres` pelo usuário configurado no seu PostgreSQL, caso necessário.

O arquivo `00_reset.sql` é destinado à remoção das tabelas existentes no schema `public`, permitindo recriar a estrutura do banco. Seu uso é opcional e destrutivo, portanto deve ser feito somente quando necessário.

## Contexto acadêmico

Projeto desenvolvido no contexto acadêmico, com foco na aplicação prática de conceitos de modelagem, estruturação e implementação de bancos de dados relacionais.
