# Caramel Coffees and Cupcakes - E-commerce de Cupcakes

Sistema de e-commerce completo para venda de cupcakes, desenvolvido como melhoria e atualização do projeto PIT_II.

## Melhorias e Atualizações em Relação ao PIT_II Original

### Arquitetura e Stack Tecnológica
- **Frontend Modernizado:** React 18 + TypeScript + Vite para desenvolvimento rápido e type-safe
- **Estilização Profissional:** Tailwind CSS para design responsivo e consistente
- **Banco de Dados Robusto:** Supabase PostgreSQL com Row Level Security (RLS)
- **Gerenciamento de Estado:** Zustand para state management eficiente
- **Roteamento:** React Router v7 para navegação entre páginas

### Funcionalidades Implementadas

#### Sistema de Autenticação
- Login e cadastro de usuários com Supabase Auth
- Gerenciamento de sessão persistente
- Diferenciação entre usuários comuns e administradores
- Proteção de rotas sensíveis

#### Catálogo de Produtos
- Listagem de cupcakes com imagens de alta qualidade (Pexels)
- Categorização por sabores
- Exibição de preço e descrição
- Sistema de estoque

#### Carrinho de Compras
- Adicionar/remover produtos
- Ajuste de quantidade
- Cálculo automático de totais
- Persistência de dados no Supabase
- Interface intuitiva e responsiva

#### Sistema de Pedidos
- Checkout completo com dados de entrega
- Histórico de pedidos do usuário
- Rastreamento de status (pendente, em preparo, enviado, entregue, cancelado)
- Visualização detalhada de cada pedido

### Segurança

#### Row Level Security (RLS)
Todas as tabelas possuem políticas RLS implementadas:
- **Usuários:** Apenas podem acessar seus próprios dados
- **Produtos:** Leitura pública para usuários anônimos, gestão apenas para admins
- **Carrinho:** Acesso restrito ao próprio usuário
- **Pedidos:** Usuários veem apenas seus pedidos, admins veem todos
- **Favoritos e Avaliações:** Acesso controlado por usuário

#### Validações
- Validação de entrada em todos os formulários
- Proteção contra SQL injection via Supabase
- Sanitização de dados do usuário

### Banco de Dados

#### Schema Completo
- `usuarios` - Perfis de usuário com flag de administrador
- `produtos` - Catálogo de cupcakes
- `carrinho` - Itens no carrinho por usuário
- `pedidos` - Registro de pedidos
- `itens_pedido` - Detalhamento de produtos em cada pedido
- `favoritos` - Lista de produtos favoritos
- `avaliacoes` - Sistema de avaliações e comentários

#### Otimizações
- Índices em colunas frequentemente consultadas
- Constraints para integridade referencial
- Triggers para atualização automática de timestamps
- Políticas RLS otimizadas para performance

### Design e UX

#### Interface Profissional
- Design limpo e moderno
- Paleta de cores neutra e elegante
- Tipografia hierárquica e legível
- Espaçamento consistente (sistema 8px)

#### Responsividade
- Layout adaptativo para mobile, tablet e desktop
- Breakpoints otimizados
- Imagens responsivas
- Menu adaptativo (hamburger em mobile)

#### Micro-interações
- Transições suaves
- Feedback visual em ações (hover, clique)
- Loading states
- Mensagens de erro/sucesso

## Estrutura do Projeto

```
project/
├── src/
│   ├── components/         # Componentes reutilizáveis
│   │   └── Navbar.tsx     # Barra de navegação
│   ├── pages/             # Páginas da aplicação
│   │   ├── Home.tsx       # Catálogo de produtos
│   │   ├── Login.tsx      # Autenticação
│   │   ├── Cadastro.tsx   # Registro de usuários
│   │   ├── Carrinho.tsx   # Carrinho de compras
│   │   ├── Checkout.tsx   # Finalização de pedido
│   │   └── MeusPedidos.tsx # Histórico de pedidos
│   ├── stores/            # Gerenciamento de estado
│   │   ├── authStore.ts   # Estado de autenticação
│   │   └── cartStore.ts   # Estado do carrinho
│   ├── lib/               # Configurações
│   │   └── supabase.ts    # Cliente Supabase
│   ├── App.tsx            # Componente raiz com rotas
│   └── main.tsx           # Entry point
├── supabase/
│   └── migrations/        # Migrações do banco de dados
├── docs/
│   ├── agil/              # Documentação ágil
│   ├── modelagem/         # Diagramas e modelos
│   └── SECURITY.md        # Guia de segurança
└── README.md
```

## Instalação e Configuração

### Pré-requisitos
- Node.js 18+
- npm ou yarn
- Conta no Supabase

### Setup

1. Clone o repositório:
```bash
git clone [URL_DO_REPOSITORIO]
cd project
```

2. Instale as dependências:
```bash
npm install
```

3. Configure as variáveis de ambiente:
Crie um arquivo `.env` na raiz do projeto:
```env
VITE_SUPABASE_URL=sua_url_do_supabase
VITE_SUPABASE_ANON_KEY=sua_chave_anonima
```

4. Execute as migrações do banco de dados:
As migrações estão em `supabase/migrations/` e devem ser aplicadas no seu projeto Supabase.

5. Inicie o servidor de desenvolvimento:
```bash
npm run dev
```

6. Build para produção:
```bash
npm run build
```

## Scripts Disponíveis

- `npm run dev` - Inicia servidor de desenvolvimento
- `npm run build` - Cria build de produção
- `npm run preview` - Preview do build de produção
- `npm run lint` - Executa linter
- `npm run typecheck` - Verifica tipos TypeScript

## Documentação Adicional

### Documentação Ágil
- [User Stories](docs/agil/01-user-stories.md)
- [Mapa de Afinidade](docs/agil/02-mapa-afinidade.md)
- [Product Backlog](docs/agil/03-product-backlog.md)
- [Requirements & Tasks](docs/agil/04-requirements-tasks.md)

### Documentação de Modelagem
- [Escopo do Projeto](docs/modelagem/01-escopo-projeto.md)
- [Diagramas UML](docs/modelagem/02-diagramas-uml.md)
- [IHC e Protótipos](docs/modelagem/03-ihc-prototipos.md)
- [Modelo de Dados](docs/modelagem/04-modelo-dados.md)
- [Dicionário de Dados](docs/modelagem/05-dicionario-dados.md)

### Segurança
- [Guia de Segurança](docs/SECURITY.md)

## Tecnologias Utilizadas

### Frontend
- **React 18.3** - Biblioteca UI
- **TypeScript 5.5** - Type safety
- **Vite 5.4** - Build tool
- **React Router 7.9** - Roteamento
- **Tailwind CSS 3.4** - Estilização
- **Lucide React** - Ícones
- **Zustand 5.0** - State management

### Backend
- **Supabase** - Backend as a Service
- **PostgreSQL** - Banco de dados
- **Supabase Auth** - Autenticação

### Desenvolvimento
- **ESLint** - Linting
- **TypeScript ESLint** - Linting TypeScript
- **PostCSS** - Processamento CSS
- **Autoprefixer** - Prefixos CSS

## Melhorias Futuras

- [ ] Sistema de pagamento integrado (Stripe/PagSeguro)
- [ ] Sistema de avaliações e comentários ativo
- [ ] Painel administrativo completo
- [ ] Sistema de notificações por email
- [ ] Programa de fidelidade/cupons de desconto
- [ ] API para integração com delivery
- [ ] PWA para instalação em dispositivos móveis
- [ ] Testes automatizados (Jest/Vitest)

## Contribuindo

1. Fork o projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

## Licença

Este projeto é uma atualização do PIT_II e mantém a mesma licença do projeto original.

## Contato

Para dúvidas ou sugestões, abra uma issue no repositório.

---

**Projeto desenvolvido como parte do PIT II - 2025**
