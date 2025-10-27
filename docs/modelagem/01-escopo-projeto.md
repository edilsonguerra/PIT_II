# Ed Cupcakes - Escopo do Projeto

## 1. Visão Geral

**Nome do Projeto:** Ed Cupcakes - Loja Virtual Gourmet

**Tipo:** Aplicação Web E-commerce

**Descrição:** Plataforma de venda online de cupcakes gourmet com design inspirado no iFood, oferecendo experiência premium de compra, personalização de produtos e gestão administrativa completa.

## 2. Objetivos

### Objetivo Geral
Desenvolver uma loja virtual completa para venda de cupcakes gourmet, proporcionando experiência de compra intuitiva e agradável aos clientes, com sistema robusto de gestão para administradores.

### Objetivos Específicos
- Criar catálogo visual atrativo de produtos com fotos e descrições detalhadas
- Implementar sistema de carrinho de compras com cálculo automático de valores
- Desenvolver autenticação segura com cadastro e login de usuários
- Permitir que clientes marquem produtos favoritos para consulta posterior
- Implementar sistema de avaliações e feedback dos produtos
- Criar painel administrativo para gestão de estoque, pedidos e relatórios
- Garantir responsividade total em dispositivos móveis e desktop
- Implementar checkout com validação de endereço e CEP

## 3. Escopo Funcional

### 3.1 Funcionalidades para Clientes

#### Navegação e Catálogo
- Visualização de catálogo de cupcakes por categorias
- Busca de produtos por nome ou categoria
- Visualização detalhada de cada produto (imagem, descrição, preço)
- Filtros por categoria, preço e disponibilidade

#### Carrinho e Compras
- Adicionar/remover produtos ao carrinho
- Ajustar quantidades de itens
- Visualizar resumo do pedido com valor total
- Adicionar observações de personalização
- Finalizar compra com endereço de entrega

#### Conta do Usuário
- Cadastro com validação de e-mail
- Login seguro com JWT
- Edição de perfil (nome, telefone, endereço, CEP)
- Histórico de pedidos
- Lista de produtos favoritos

#### Avaliações
- Avaliar produtos comprados (nota de 1 a 5)
- Deixar comentários sobre os produtos
- Visualizar avaliações de outros clientes

### 3.2 Funcionalidades Administrativas

#### Gestão de Produtos
- Cadastrar novos cupcakes
- Editar informações de produtos
- Upload de imagens
- Gerenciar estoque (quantidade disponível)
- Ativar/desativar produtos

#### Gestão de Pedidos
- Visualizar todos os pedidos
- Atualizar status (pendente → confirmado → preparando → enviado → entregue)
- Cancelar pedidos quando necessário
- Filtrar pedidos por status e data

#### Relatórios
- Produtos mais vendidos
- Receita por período
- Avaliações médias dos produtos
- Lista de clientes cadastrados

### 3.3 Funcionalidades do Sistema

#### Autenticação e Segurança
- Registro de novos usuários
- Login com e-mail e senha
- Tokens JWT para sessões
- Criptografia de senhas (bcrypt)
- Recuperação de senha por e-mail

#### Notificações
- E-mail de confirmação de cadastro
- E-mail de confirmação de pedido
- Notificação de mudança de status do pedido

## 4. Escopo Não Funcional

### 4.1 Requisitos de Performance
- Tempo de carregamento de página < 3 segundos
- Suporte a pelo menos 100 usuários simultâneos
- Otimização de imagens para carregamento rápido

### 4.2 Requisitos de Usabilidade
- Interface em português do Brasil
- Design responsivo (mobile-first)
- Navegação intuitiva inspirada no iFood
- Feedback visual para todas as ações do usuário
- Mensagens de erro claras e orientativas

### 4.3 Requisitos de Segurança
- Criptografia de senhas
- Proteção contra SQL Injection
- Validação de dados no frontend e backend
- HTTPS obrigatório em produção
- Row Level Security (RLS) no banco de dados
- Tokens JWT com expiração

### 4.4 Requisitos de Compatibilidade
- Navegadores: Chrome, Firefox, Safari, Edge (últimas 2 versões)
- Dispositivos: Desktop, tablet e smartphone
- Resoluções: 320px a 1920px

## 5. Tecnologias Definidas

### Frontend
- **Framework:** React 18 com TypeScript
- **Gerenciamento de Estado:** Zustand
- **Estilização:** Tailwind CSS
- **Ícones:** Lucide React
- **Build Tool:** Vite

### Backend
- **Linguagem:** Python 3.10+
- **Framework:** FastAPI
- **Padrão:** MVC (Model-View-Controller)
- **ORM:** SQLAlchemy

### Banco de Dados
- **SGBD:** PostgreSQL (Supabase)
- **Autenticação:** Supabase Auth
- **Storage:** Supabase Storage (para imagens)

### Deploy
- **Frontend:** Netlify
- **Backend:** Render ou Heroku
- **Banco de Dados:** Supabase (hospedado)

## 6. Identidade Visual

### Paleta de Cores
- **Primária:** Roxo (#5B2C6F) - Sofisticação e gourmet
- **Secundária:** Verde Escuro (#145A32) - Frescor e qualidade
- **Background:** Cinza Claro (#F8FAFC)
- **Texto:** Cinza Escuro (#1F2937)
- **Acentos:** Branco (#FFFFFF)

### Tipografia
- **Títulos:** Poppins (Bold, SemiBold)
- **Corpo:** Inter (Regular, Medium)

### Estilo
- Design limpo e minimalista
- Cards com sombras suaves
- Hover effects suaves
- Inspiração no layout do iFood
- Imagens de produtos em destaque

## 7. Estrutura de Navegação

### Para Clientes
```
Home (Catálogo)
├── Produto Detalhado
├── Carrinho
│   └── Checkout
├── Minha Conta
│   ├── Perfil
│   ├── Meus Pedidos
│   └── Favoritos
└── Login/Cadastro
```

### Para Administradores
```
Dashboard Admin
├── Gestão de Produtos
│   ├── Lista de Produtos
│   ├── Adicionar Produto
│   └── Editar Produto
├── Gestão de Pedidos
│   └── Lista de Pedidos
└── Relatórios
    ├── Vendas
    └── Avaliações
```

## 8. Entregas da Fase 1

- [x] Definição completa do escopo
- [ ] Diagramas UML atualizados
- [ ] Protótipos de telas (wireframes/mockups)
- [ ] Modelo conceitual do banco de dados
- [ ] Modelo lógico do banco de dados
- [x] Modelo físico implementado (SQL)
- [ ] Dicionário de dados
- [ ] Documentação organizada em `/docs/modelagem`

## 9. Restrições e Premissas

### Restrições
- Projeto acadêmico com prazo definido
- Orçamento zero (uso de ferramentas gratuitas)
- Foco em funcionalidades essenciais (MVP)

### Premissas
- Usuários têm acesso à internet
- Clientes possuem e-mail válido para cadastro
- Pagamentos não serão processados (simulação apenas)
- Entrega será coordenada offline (sem integração com transportadoras)

## 10. Critérios de Sucesso

- Sistema funcional com todas as funcionalidades principais implementadas
- Interface responsiva e intuitiva
- Autenticação e autorização funcionando corretamente
- Banco de dados seguro com RLS
- Deploy realizado com sucesso
- Feedback positivo de pelo menos 4 dos 5 testadores
- Código documentado e versionado no GitHub
