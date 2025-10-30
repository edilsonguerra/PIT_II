# Ed Cupcakes - Diagramas UML

## 1. Diagrama de Casos de Uso

### 1.1 Atores

- **Cliente:** Usuário final que compra cupcakes
- **Administrador:** Gerencia produtos, pedidos e visualiza relatórios
- **Sistema de E-mail:** Envia notificações automáticas
- **Sistema de Autenticação:** Valida credenciais

### 1.2 Casos de Uso - Cliente

#### UC01 - Cadastrar-se no Sistema
**Ator Principal:** Cliente
**Descrição:** Cliente cria uma nova conta na plataforma
**Fluxo Principal:**
1. Cliente acessa página de cadastro
2. Sistema exibe formulário com campos: nome, e-mail, senha, telefone
3. Cliente preenche dados e confirma
4. Sistema valida dados
5. Sistema cria conta e envia e-mail de confirmação
6. Sistema autentica automaticamente o usuário

**Fluxos Alternativos:**
- 4a. E-mail já cadastrado: Sistema exibe mensagem de erro
- 4b. Senha fraca: Sistema solicita senha mais forte

#### UC02 - Fazer Login
**Ator Principal:** Cliente
**Descrição:** Cliente acessa sua conta existente
**Fluxo Principal:**
1. Cliente acessa página de login
2. Sistema exibe formulário de autenticação
3. Cliente informa e-mail e senha
4. Sistema valida credenciais
5. Sistema gera token JWT
6. Sistema redireciona para página inicial

**Fluxos Alternativos:**
- 4a. Credenciais inválidas: Sistema exibe erro e permite nova tentativa

#### UC03 - Navegar no Catálogo
**Ator Principal:** Cliente
**Descrição:** Cliente visualiza produtos disponíveis
**Fluxo Principal:**
1. Cliente acessa página inicial
2. Sistema exibe lista de cupcakes ativos
3. Cliente pode filtrar por categoria
4. Sistema atualiza listagem conforme filtro
5. Cliente pode clicar em produto para ver detalhes

#### UC04 - Visualizar Detalhes do Produto
**Ator Principal:** Cliente
**Descrição:** Cliente vê informações completas de um cupcake
**Fluxo Principal:**
1. Cliente clica em um produto
2. Sistema exibe imagem ampliada, descrição, preço e avaliações
3. Cliente pode adicionar ao carrinho ou favoritar
4. Cliente pode ler avaliações de outros usuários

#### UC05 - Adicionar ao Carrinho
**Ator Principal:** Cliente
**Descrição:** Cliente adiciona produto ao carrinho de compras
**Fluxo Principal:**
1. Cliente visualiza produto
2. Cliente clica em "Adicionar ao Carrinho"
3. Cliente define quantidade
4. Sistema adiciona item ao carrinho
5. Sistema exibe confirmação visual
6. Sistema atualiza contador do carrinho

#### UC06 - Gerenciar Carrinho
**Ator Principal:** Cliente
**Descrição:** Cliente visualiza e modifica itens do carrinho
**Fluxo Principal:**
1. Cliente acessa carrinho
2. Sistema exibe lista de itens com quantidades e preços
3. Cliente pode alterar quantidade ou remover itens
4. Sistema recalcula total automaticamente
5. Cliente pode adicionar observações de personalização
6. Cliente pode finalizar pedido

#### UC07 - Finalizar Pedido (Checkout)
**Ator Principal:** Cliente
**Pré-condição:** Cliente autenticado e carrinho com itens
**Fluxo Principal:**
1. Cliente clica em "Finalizar Pedido"
2. Sistema exibe formulário com dados de entrega
3. Cliente confirma/edita endereço e CEP
4. Sistema valida CEP
5. Cliente adiciona observações (opcional)
6. Cliente confirma pedido
7. Sistema cria pedido no banco
8. Sistema esvazia carrinho
9. Sistema envia e-mail de confirmação
10. Sistema exibe página de sucesso com número do pedido

**Fluxos Alternativos:**
- 4a. CEP inválido: Sistema solicita correção

#### UC08 - Adicionar aos Favoritos
**Ator Principal:** Cliente
**Pré-condição:** Cliente autenticado
**Fluxo Principal:**
1. Cliente visualiza produto
2. Cliente clica no ícone de favorito
3. Sistema adiciona produto à lista de favoritos
4. Sistema exibe feedback visual

#### UC09 - Visualizar Favoritos
**Ator Principal:** Cliente
**Pré-condição:** Cliente autenticado
**Fluxo Principal:**
1. Cliente acessa "Meus Favoritos"
2. Sistema exibe lista de produtos favoritados
3. Cliente pode clicar para ver detalhes ou adicionar ao carrinho
4. Cliente pode remover da lista de favoritos

#### UC10 - Avaliar Produto
**Ator Principal:** Cliente
**Pré-condição:** Cliente autenticado
**Fluxo Principal:**
1. Cliente acessa produto
2. Cliente clica em "Avaliar"
3. Sistema exibe formulário com nota (1-5) e comentário
4. Cliente preenche avaliação
5. Sistema salva avaliação
6. Sistema atualiza média de avaliações do produto

#### UC11 - Visualizar Meus Pedidos
**Ator Principal:** Cliente
**Pré-condição:** Cliente autenticado
**Fluxo Principal:**
1. Cliente acessa "Meus Pedidos"
2. Sistema exibe histórico de pedidos com status
3. Cliente pode clicar em pedido para ver detalhes
4. Sistema exibe itens, valor total e informações de entrega

#### UC12 - Editar Perfil
**Ator Principal:** Cliente
**Pré-condição:** Cliente autenticado
**Fluxo Principal:**
1. Cliente acessa "Meu Perfil"
2. Sistema exibe dados cadastrais
3. Cliente edita informações (nome, telefone, endereço, CEP)
4. Cliente confirma alterações
5. Sistema valida e salva dados
6. Sistema exibe confirmação

### 1.3 Casos de Uso - Administrador

#### UC13 - Gerenciar Produtos
**Ator Principal:** Administrador
**Descrição:** Admin cria, edita ou remove produtos
**Fluxo Principal (Criar):**
1. Admin acessa "Gestão de Produtos"
2. Admin clica em "Adicionar Produto"
3. Sistema exibe formulário
4. Admin preenche: nome, descrição, preço, categoria, estoque, imagem
5. Admin confirma
6. Sistema valida e salva produto
7. Sistema exibe confirmação

**Fluxo Principal (Editar):**
1. Admin seleciona produto existente
2. Sistema exibe dados atuais
3. Admin modifica informações
4. Admin confirma
5. Sistema atualiza produto

**Fluxo Principal (Desativar):**
1. Admin marca produto como inativo
2. Sistema oculta produto do catálogo público

#### UC14 - Gerenciar Pedidos
**Ator Principal:** Administrador
**Descrição:** Admin visualiza e atualiza status de pedidos
**Fluxo Principal:**
1. Admin acessa "Gestão de Pedidos"
2. Sistema exibe lista de pedidos com filtros
3. Admin pode filtrar por status ou data
4. Admin seleciona pedido
5. Sistema exibe detalhes completos
6. Admin atualiza status (pendente → confirmado → preparando → enviado → entregue)
7. Sistema salva alteração
8. Sistema envia e-mail ao cliente notificando mudança

#### UC15 - Visualizar Relatórios
**Ator Principal:** Administrador
**Descrição:** Admin acessa dados estatísticos e relatórios
**Fluxo Principal:**
1. Admin acessa "Relatórios"
2. Sistema exibe opções: vendas, produtos, avaliações
3. Admin seleciona tipo de relatório
4. Admin define período (opcional)
5. Sistema gera e exibe dados:
   - Produtos mais vendidos
   - Receita por período
   - Avaliações médias
   - Lista de clientes

---

## 2. Diagrama de Classes

### 2.1 Classes Principais

```
┌─────────────────────────────────┐
│         Usuario                 │
├─────────────────────────────────┤
│ - id: UUID                      │
│ - nome: string                  │
│ - email: string                 │
│ - telefone: string              │
│ - endereco: string              │
│ - cep: string                   │
│ - ehAdmin: boolean              │
│ - criadoEm: DateTime            │
│ - atualizadoEm: DateTime        │
├─────────────────────────────────┤
│ + cadastrar()                   │
│ + login()                       │
│ + editarPerfil()                │
│ + visualizarPedidos()           │
└─────────────────────────────────┘
         │
         │ 1
         │
         │ *
┌─────────────────────────────────┐
│         Pedido                  │
├─────────────────────────────────┤
│ - id: UUID                      │
│ - usuarioId: UUID               │
│ - status: string                │
│ - total: decimal                │
│ - enderecoEntrega: string       │
│ - cepEntrega: string            │
│ - observacoes: string           │
│ - criadoEm: DateTime            │
│ - atualizadoEm: DateTime        │
├─────────────────────────────────┤
│ + criar()                       │
│ + atualizarStatus()             │
│ + calcularTotal()               │
│ + cancelar()                    │
└─────────────────────────────────┘
         │
         │ 1
         │
         │ *
┌─────────────────────────────────┐
│       ItemPedido                │
├─────────────────────────────────┤
│ - id: UUID                      │
│ - pedidoId: UUID                │
│ - produtoId: UUID               │
│ - quantidade: integer           │
│ - precoUnitario: decimal        │
│ - subtotal: decimal             │
│ - personalizacao: string        │
├─────────────────────────────────┤
│ + calcularSubtotal()            │
└─────────────────────────────────┘
         │
         │ *
         │
         │ 1
┌─────────────────────────────────┐
│         Produto                 │
├─────────────────────────────────┤
│ - id: UUID                      │
│ - nome: string                  │
│ - descricao: string             │
│ - preco: decimal                │
│ - imagemUrl: string             │
│ - categoria: string             │
│ - estoque: integer              │
│ - ativo: boolean                │
│ - criadoEm: DateTime            │
│ - atualizadoEm: DateTime        │
├─────────────────────────────────┤
│ + criar()                       │
│ + editar()                      │
│ + desativar()                   │
│ + atualizarEstoque()            │
│ + obterAvaliacaoMedia()         │
└─────────────────────────────────┘
         │                │
         │ *              │ *
         │                │
         │ *              │ 1
┌──────────────────┐  ┌──────────────────┐
│    Favorito      │  │    Avaliacao     │
├──────────────────┤  ├──────────────────┤
│ - id: UUID       │  │ - id: UUID       │
│ - usuarioId: UUID│  │ - usuarioId: UUID│
│ - produtoId: UUID│  │ - produtoId: UUID│
│ - criadoEm: DT   │  │ - nota: integer  │
├──────────────────┤  │ - comentario: st │
│ + adicionar()    │  │ - criadoEm: DT   │
│ + remover()      │  ├──────────────────┤
└──────────────────┘  │ + criar()        │
                      │ + editar()       │
                      │ + deletar()      │
                      └──────────────────┘
```

### 2.2 Relacionamentos

- **Usuario** 1 ─── * **Pedido**
- **Pedido** 1 ─── * **ItemPedido**
- **Produto** 1 ─── * **ItemPedido**
- **Usuario** * ─── * **Produto** (através de Favorito)
- **Usuario** * ─── * **Produto** (através de Avaliacao)

---

## 3. Diagrama de Sequência

### 3.1 Sequência: Finalizar Pedido

```
Cliente          Frontend          Backend          Database          Email
  │                │                │                │                │
  │─Clicar Checkout─→│              │                │                │
  │                │─GET /carrinho──→│               │                │
  │                │←──dados carrinho─│              │                │
  │                │                │                │                │
  │                │─Exibir Checkout─→│              │                │
  │←───Formulário───│                │                │                │
  │                │                │                │                │
  │─Confirmar dados→│                │                │                │
  │                │─POST /pedidos──→│               │                │
  │                │                │─INSERT pedido─→│                │
  │                │                │←─pedido_id────│                │
  │                │                │─INSERT itens──→│                │
  │                │                │←─sucesso──────│                │
  │                │                │─Enviar email──────────────────→│
  │                │←─pedido criado──│               │                │
  │←─Tela sucesso───│                │                │                │
  │                │                │                │                │─Email enviado─→
```

### 3.2 Sequência: Login de Usuário

```
Cliente          Frontend          Backend          Database
  │                │                │                │
  │─Inserir email/senha─→│          │                │
  │                │─POST /login────→│               │
  │                │                │─SELECT user───→│
  │                │                │←─dados user───│
  │                │                │─Verificar senha│
  │                │                │─Gerar JWT─────│
  │                │←─token JWT─────│                │
  │                │─Armazenar token│                │
  │←─Redirecionar Home──│            │                │
```

### 3.3 Sequência: Adicionar Produto (Admin)

```
Admin            Frontend          Backend          Database
  │                │                │                │
  │─Preencher form─→│               │                │
  │─Upload imagem──→│               │                │
  │                │─POST /produtos─→│               │
  │                │ (com imagem)   │                │
  │                │                │─Upload storage→│
  │                │                │←─URL imagem───│
  │                │                │─INSERT produto→│
  │                │                │←─produto_id───│
  │                │←─sucesso───────│                │
  │←─Produto criado─│                │                │
```

---

## 4. Diagrama de Atividades

### 4.1 Atividade: Processo de Compra

```
[Início]
   ↓
[Cliente navega catálogo]
   ↓
<Produto interessante?>
   │
   Não → [Continuar navegando] → (volta)
   │
   Sim
   ↓
[Visualizar detalhes]
   ↓
[Adicionar ao carrinho]
   ↓
<Continuar comprando?>
   │
   Sim → (volta para catálogo)
   │
   Não
   ↓
[Acessar carrinho]
   ↓
[Revisar itens]
   ↓
<Fazer ajustes?>
   │
   Sim → [Alterar quantidade/Remover] → (volta)
   │
   Não
   ↓
[Clicar "Finalizar Pedido"]
   ↓
<Usuário logado?>
   │
   Não → [Fazer login/cadastro] → (volta)
   │
   Sim
   ↓
[Preencher dados de entrega]
   ↓
[Sistema valida CEP]
   ↓
<CEP válido?>
   │
   Não → [Solicitar correção] → (volta)
   │
   Sim
   ↓
[Adicionar observações (opcional)]
   ↓
[Confirmar pedido]
   ↓
[Sistema cria pedido no banco]
   ↓
[Sistema envia e-mail confirmação]
   ↓
[Exibir número do pedido]
   ↓
[Esvaziar carrinho]
   ↓
[Fim]
```

### 4.2 Atividade: Gestão de Pedido (Admin)

```
[Início]
   ↓
[Admin acessa painel pedidos]
   ↓
[Sistema lista pedidos]
   ↓
[Admin seleciona pedido]
   ↓
[Sistema exibe detalhes]
   ↓
<Atualizar status?>
   │
   Não → <Cancelar pedido?>
   │         │
   │         Sim → [Marcar cancelado] → [Fim]
   │         │
   │         Não → [Fim]
   │
   Sim
   ↓
[Admin muda status]
   ↓
[Sistema atualiza banco]
   ↓
[Sistema envia e-mail cliente]
   ↓
[Exibir confirmação]
   ↓
[Fim]
```

---

## 5. Diagrama de Estados

### 5.1 Estados do Pedido

```
┌─────────────┐
│  Pendente   │ ← Estado inicial após criação
└──────┬──────┘
       │ Admin confirma
       ↓
┌─────────────┐
│ Confirmado  │
└──────┬──────┘
       │ Admin inicia preparo
       ↓
┌─────────────┐
│ Preparando  │
└──────┬──────┘
       │ Admin envia
       ↓
┌─────────────┐
│   Enviado   │
└──────┬──────┘
       │ Cliente/Admin confirma recebimento
       ↓
┌─────────────┐
│  Entregue   │ ← Estado final (sucesso)
└─────────────┘

         ┌─────────────┐
         │ Cancelado   │ ← Estado final (pode ser acessado de qualquer estado anterior)
         └─────────────┘
```

### 5.2 Estados do Produto

```
┌─────────────┐
│   Ativo     │ ← Visível no catálogo
└──────┬──────┘
       │ Admin desativa
       ↓
┌─────────────┐
│  Inativo    │ ← Oculto do catálogo
└──────┬──────┘
       │ Admin reativa
       ↓
    (volta para Ativo)
```

---

## 6. Notas de Implementação

### Padrões Aplicados
- **MVC:** Separação entre Model (dados), View (interface) e Controller (lógica)
- **Repository Pattern:** Abstração de acesso ao banco de dados
- **JWT:** Autenticação stateless com tokens
- **RLS (Row Level Security):** Segurança a nível de banco de dados

### Validações Importantes
- E-mail único no cadastro
- Senha com mínimo 8 caracteres
- CEP no formato válido
- Preços e quantidades sempre positivos
- Notas de avaliação entre 1 e 5
- Estoque não pode ser negativo

### Fluxos Críticos
1. **Autenticação:** Todo acesso a dados pessoais requer login válido
2. **Autorização:** Apenas admins podem gerenciar produtos e pedidos
3. **Integridade:** Pedidos só podem ser criados se produtos estiverem em estoque
4. **Auditoria:** Todos os registros mantêm data de criação e atualização
