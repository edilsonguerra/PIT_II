# Ed Cupcakes - Documentação de Modelagem (Fase 1)

## Índice

1. [01 - Escopo do Projeto](./01-escopo-projeto.md)
2. [02 - Diagramas UML](./02-diagramas-uml.md)
3. [03 - IHC e Protótipos](./03-ihc-prototipos.md)
4. [04 - Modelo de Dados](./04-modelo-dados.md)
5. [05 - Dicionário de Dados](./05-dicionario-dados.md)

---

## Visão Geral da Fase 1

Esta pasta contém toda a documentação da **Situação 1 - Planejamento e Modelagem** do Projeto Integrador Transdisciplinar de Engenharia de Software.

### Objetivo da Fase

Revisar e adequar o escopo e a ideia do projeto, criar/atualizar diagramas UML, revisar a IHC e protótipos, criar o modelo conceitual e lógico do banco de dados, e implementar o projeto físico.

---

## Estrutura da Documentação

### 📄 [01 - Escopo do Projeto](./01-escopo-projeto.md)

**Conteúdo:**
- Visão geral do projeto Ed Cupcakes
- Objetivos gerais e específicos
- Funcionalidades detalhadas para clientes e administradores
- Requisitos funcionais e não funcionais
- Stack tecnológica definida
- Identidade visual e paleta de cores
- Estrutura de navegação
- Restrições e premissas
- Critérios de sucesso

**Status:** ✅ Completo

---

### 📐 [02 - Diagramas UML](./02-diagramas-uml.md)

**Conteúdo:**
- **Diagrama de Casos de Uso**
  - 15 casos de uso detalhados (UC01 a UC15)
  - Fluxos principais e alternativos
  - Atores: Cliente, Administrador, Sistema

- **Diagrama de Classes**
  - 6 classes principais com atributos e métodos
  - Relacionamentos entre classes

- **Diagramas de Sequência**
  - Finalizar pedido
  - Login de usuário
  - Adicionar produto (Admin)

- **Diagramas de Atividades**
  - Processo de compra completo
  - Gestão de pedido pelo admin

- **Diagrama de Estados**
  - Estados do pedido (pendente → entregue)
  - Estados do produto (ativo/inativo)

**Status:** ✅ Completo

---

### 🎨 [03 - IHC e Protótipos](./03-ihc-prototipos.md)

**Conteúdo:**
- **Princípios de IHC**
  - 10 heurísticas de Nielsen aplicadas
  - Diretrizes de usabilidade
  - Requisitos de acessibilidade
  - Estratégia de responsividade (mobile/tablet/desktop)

- **Design System**
  - Paleta de cores completa (roxo #5B2C6F + verde #145A32)
  - Tipografia (Poppins + Inter)
  - Escala tipográfica definida

- **Componentes da Interface**
  - Navbar
  - Sidebar
  - Cards de produto
  - Modal de carrinho
  - Modal de detalhes do produto
  - Formulário de checkout

- **Wireframes ASCII**
  - Home (catálogo)
  - Página do produto
  - Meus pedidos
  - Dashboard admin

- **Interações e Animações**
  - Hover states
  - Micro-animações
  - Transições
  - Mensagens de feedback

**Status:** ✅ Completo

---

### 🗄️ [04 - Modelo de Dados](./04-modelo-dados.md)

**Conteúdo:**
- **Modelo Conceitual (MER)**
  - 6 entidades principais
  - 5 relacionamentos com cardinalidades
  - Diagrama ER textual

- **Modelo Lógico (Relacional)**
  - Esquema relacional completo de 6 tabelas
  - Todas as chaves primárias e estrangeiras
  - Normalização (1FN, 2FN, 3FN, FNBC)
  - Índices para otimização

- **Dependências Funcionais**
  - Mapeamento completo por tabela

- **Integridade Referencial**
  - Regras de CASCADE e RESTRICT
  - Justificativas técnicas

- **Consultas SQL Importantes**
  - Produtos mais vendidos
  - Avaliação média
  - Pedidos com itens
  - Receita por período

**Status:** ✅ Completo

---

### 📖 [05 - Dicionário de Dados](./05-dicionario-dados.md)

**Conteúdo:**
- **Documentação Completa de 6 Tabelas:**
  - `usuarios` - 9 colunas
  - `produtos` - 10 colunas
  - `pedidos` - 9 colunas
  - `itens_pedido` - 7 colunas
  - `favoritos` - 4 colunas
  - `avaliacoes` - 6 colunas

- **Para Cada Tabela:**
  - Descrição e propósito
  - Detalhamento de todas as colunas (tipo, tamanho, restrições)
  - Constraints (PK, FK, CHECK, UNIQUE)
  - Índices criados
  - Políticas RLS aplicadas
  - Regras de negócio implementadas
  - Valores permitidos
  - Observações técnicas

- **Seções Adicionais:**
  - Diagrama de relacionamentos
  - Índices e performance
  - Triggers e automações
  - Resumo de segurança RLS
  - Convenções e padrões
  - Estratégias de backup
  - Glossário técnico

**Status:** ✅ Completo

---

## Tecnologias Documentadas

### Frontend
- **Framework:** React 18 + TypeScript
- **Estado:** Zustand
- **Estilo:** Tailwind CSS
- **Ícones:** Lucide React
- **Build:** Vite

### Backend
- **Linguagem:** Python 3.10+
- **Framework:** FastAPI
- **Padrão:** MVC
- **ORM:** SQLAlchemy (se necessário)

### Banco de Dados
- **SGBD:** PostgreSQL 15+ (Supabase)
- **Autenticação:** Supabase Auth
- **Storage:** Supabase Storage
- **Segurança:** Row Level Security (RLS)

### Deploy
- **Frontend:** Netlify
- **Backend:** Render / Heroku
- **Banco:** Supabase (cloud)

---

## Database Schema (Implementado)

### Tabelas Criadas

```sql
-- 6 tabelas principais
usuarios (id, nome, email, telefone, endereco, cep, eh_admin, criado_em, atualizado_em)
produtos (id, nome, descricao, preco, imagem_url, categoria, estoque, ativo, criado_em, atualizado_em)
pedidos (id, usuario_id, status, total, endereco_entrega, cep_entrega, observacoes, criado_em, atualizado_em)
itens_pedido (id, pedido_id, produto_id, quantidade, preco_unitario, subtotal, personalizacao)
favoritos (id, usuario_id, produto_id, criado_em)
avaliacoes (id, usuario_id, produto_id, nota, comentario, criado_em)
```

### Relacionamentos

```
USUARIOS (1:N) PEDIDOS (1:N) ITENS_PEDIDO (N:1) PRODUTOS
    |                                               |
    +--- (N:M via FAVORITOS) ----------------------+
    +--- (N:M via AVALIACOES) ---------------------+
```

### Segurança

- ✅ Row Level Security habilitado em todas as tabelas
- ✅ 26 políticas RLS implementadas
- ✅ Usuários acessam apenas seus próprios dados
- ✅ Admins têm permissões especiais
- ✅ Produtos públicos, gestão restrita

---

## Checklist da Fase 1

- [x] Definir e documentar escopo completo
- [x] Criar 5 tipos de diagramas UML
  - [x] Casos de uso (15 casos documentados)
  - [x] Classes (6 classes com relacionamentos)
  - [x] Sequência (3 fluxos principais)
  - [x] Atividades (2 processos)
  - [x] Estados (2 máquinas de estado)
- [x] Documentar IHC e protótipos
  - [x] Princípios de usabilidade
  - [x] Paleta de cores e tipografia
  - [x] Componentes da interface
  - [x] Wireframes de telas principais
- [x] Criar modelo conceitual do banco
- [x] Criar modelo lógico do banco
- [x] Implementar modelo físico (SQL)
- [x] Criar dicionário de dados completo
- [x] Organizar documentação em `/docs/modelagem`
- [x] Implementar schema no Supabase
- [x] Configurar Row Level Security

---

## Próximos Passos (Fase 2)

A **Situação 2 - Desenvolvimento e Implementação** incluirá:

1. Criar repositório público no GitHub
2. Implementar frontend React + TypeScript + Zustand + Tailwind
3. Implementar backend FastAPI com padrão MVC
4. Desenvolver rotas principais (produtos, usuários, pedidos, favoritos)
5. Criar autenticação JWT
6. Implementar envio de e-mails
7. Deploy no Netlify (frontend) e Render/Heroku (backend)
8. Documentar endpoints em `/docs/api`

---

## Autores

**Projeto Integrador Transdisciplinar**
**Curso:** Engenharia de Software
**Projeto:** Ed Cupcakes - Loja Virtual Gourmet
**Fase Atual:** Situação 1 (Planejamento e Modelagem)
**Status:** ✅ Concluída
**Data:** 22/10/2025

---

## Licença

Este projeto é de uso acadêmico para fins educacionais.

---

## Contato

Para dúvidas sobre a documentação ou projeto, consulte os arquivos individuais nesta pasta.
