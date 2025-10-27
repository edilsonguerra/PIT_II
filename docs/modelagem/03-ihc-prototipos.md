# Ed Cupcakes - IHC e Protótipos de Telas

## 1. Princípios de Interface Humano-Computador (IHC)

### 1.1 Usabilidade
A interface do Ed Cupcakes foi projetada seguindo os princípios de usabilidade de Nielsen:

1. **Visibilidade do Status do Sistema**
   - Indicadores visuais de carregamento
   - Feedback imediato para todas as ações (adicionar ao carrinho, favoritar, etc.)
   - Badge no ícone do carrinho mostrando quantidade de itens
   - Status do pedido claramente visível

2. **Correspondência entre Sistema e Mundo Real**
   - Linguagem simples e em português do Brasil
   - Metáforas familiares (carrinho de compras, coração para favoritos)
   - Organização por categorias como em lojas físicas

3. **Controle e Liberdade do Usuário**
   - Possibilidade de remover itens do carrinho
   - Edição de perfil a qualquer momento
   - Cancelamento de pedidos pendentes
   - Navegação clara com breadcrumbs

4. **Consistência e Padrões**
   - Botões primários sempre na mesma cor (roxo)
   - Layout consistente em todas as páginas
   - Ícones padronizados (Lucide React)
   - Mensagens de erro e sucesso no mesmo formato

5. **Prevenção de Erros**
   - Validação em tempo real de formulários
   - Confirmação antes de remover itens
   - Desabilitação de botões durante processamento
   - Limites visuais de estoque disponível

6. **Reconhecimento ao Invés de Memorização**
   - Menu de navegação sempre visível
   - Histórico de pedidos acessível
   - Produtos favoritados salvos
   - Auto-completar em campos de endereço

7. **Flexibilidade e Eficiência de Uso**
   - Busca rápida de produtos
   - Filtros por categoria
   - Atalhos visuais para ações frequentes
   - Checkout simplificado para usuários recorrentes

8. **Design Estético e Minimalista**
   - Foco nas imagens dos produtos
   - Espaço em branco adequado
   - Informações essenciais em destaque
   - Sem elementos desnecessários

9. **Ajudar Usuários a Reconhecer, Diagnosticar e Recuperar de Erros**
   - Mensagens de erro claras e descritivas
   - Sugestões de correção
   - Validação campo a campo

10. **Ajuda e Documentação**
    - Tooltips em ações específicas
    - Placeholders informativos em formulários
    - Mensagens orientativas no primeiro acesso

### 1.2 Acessibilidade

- **Contraste:** Todas as cores atendem WCAG 2.1 AA
- **Tipografia:** Fontes legíveis (Inter para corpo, mínimo 16px)
- **Responsividade:** Layout adaptável de 320px a 1920px
- **Navegação por Teclado:** Foco visível em todos elementos interativos
- **Alt Text:** Todas as imagens com descrição alternativa

### 1.3 Responsividade

#### Mobile (320px - 767px)
- Menu hambúrguer
- Cards empilhados verticalmente
- Botões de ação em largura total
- Imagens otimizadas

#### Tablet (768px - 1023px)
- Grid de 2 colunas para produtos
- Menu expandido parcial
- Layout híbrido

#### Desktop (1024px+)
- Sidebar lateral fixa
- Grid de 3-4 colunas para produtos
- Hover effects completos
- Layout completo

---

## 2. Paleta de Cores e Tipografia

### 2.1 Cores

#### Cores Principais
```
Roxo Primário:    #5B2C6F (Botões, destaques, headers)
Verde Secundário: #145A32 (Badges de sucesso, status ativo)
Cinza Claro:      #F8FAFC (Background principal)
Branco:           #FFFFFF (Cards, modais)
```

#### Cores de Texto
```
Texto Principal:  #1F2937 (Títulos, corpo)
Texto Secundário: #6B7280 (Descrições, labels)
Texto Terciário:  #9CA3AF (Placeholders)
```

#### Cores de Feedback
```
Sucesso:  #10B981 (Confirmações)
Erro:     #EF4444 (Erros, alertas)
Aviso:    #F59E0B (Avisos)
Info:     #3B82F6 (Informações)
```

#### Cores de Estado
```
Hover Roxo:    #7C3A99
Disabled:      #D1D5DB
Border:        #E5E7EB
Shadow:        rgba(91, 44, 111, 0.1)
```

### 2.2 Tipografia

#### Família de Fontes
```
Títulos e Headers: 'Poppins', sans-serif
Corpo e Interface: 'Inter', sans-serif
```

#### Escala Tipográfica
```
H1: 2.5rem (40px) - Bold - Páginas principais
H2: 2rem (32px) - SemiBold - Seções
H3: 1.5rem (24px) - SemiBold - Cards, títulos de produto
H4: 1.25rem (20px) - Medium - Subtítulos
Body Large: 1.125rem (18px) - Regular - Destaques
Body: 1rem (16px) - Regular - Texto padrão
Body Small: 0.875rem (14px) - Regular - Legendas
Caption: 0.75rem (12px) - Regular - Metadados
```

#### Espaçamento e Altura de Linha
```
Títulos: line-height 1.2
Corpo: line-height 1.5
Espaçamento entre seções: 2-4rem
Espaçamento entre elementos: 0.5-1rem
```

---

## 3. Componentes da Interface

### 3.1 Navbar (Barra de Navegação Superior)

**Estrutura:**
```
┌────────────────────────────────────────────────────────────┐
│  [Logo Ed Cupcakes]  [Busca]  [Carrinho] [Favoritos] [User]│
└────────────────────────────────────────────────────────────┘
```

**Elementos:**
- Logo: Ícone de cupcake + texto "Ed Cupcakes"
- Barra de busca centralizada com ícone de lupa
- Ícone de carrinho com badge (quantidade de itens)
- Ícone de coração (favoritos)
- Avatar/menu do usuário (dropdown)

**Comportamento:**
- Fixada no topo (sticky)
- Sombra sutil ao scrollar
- Responsiva: logo menor e menu hambúrguer no mobile

### 3.2 Sidebar (Menu Lateral)

**Estrutura Desktop:**
```
┌──────────────────┐
│  Categorias      │
│  ───────────     │
│  ☰ Todas         │
│  🍫 Chocolate    │
│  🍓 Frutas       │
│  🌟 Especiais    │
│  🎉 Festas       │
│                  │
│  Minha Conta     │
│  ───────────     │
│  👤 Perfil       │
│  📦 Pedidos      │
│  ❤️  Favoritos   │
│  🚪 Sair         │
└──────────────────┘
```

**Comportamento:**
- Desktop: sempre visível à esquerda
- Tablet: colapsável
- Mobile: drawer lateral (hambúrguer)
- Categoria ativa destacada em roxo

### 3.3 Card de Produto

**Layout:**
```
┌─────────────────────┐
│                     │
│   [Imagem Grande]   │
│                     │
│  ❤️ (Favoritar)     │
├─────────────────────┤
│ Cupcake Red Velvet  │ ← Título (H3)
│ Massa vermelha...   │ ← Descrição curta
│                     │
│ ⭐⭐⭐⭐⭐ (4.8)      │ ← Avaliação
│                     │
│ R$ 12,50            │ ← Preço (destaque)
│                     │
│ [Adicionar] 🛒      │ ← Botão primário
└─────────────────────┘
```

**Estados:**
- **Normal:** Sombra leve
- **Hover:** Sombra elevada, leve escala (1.02)
- **Sem estoque:** Opacidade reduzida, badge "Esgotado"

### 3.4 Carrinho (Modal/Drawer)

**Estrutura:**
```
┌────────────────────────────────────┐
│  🛒 Meu Carrinho            [X]    │
├────────────────────────────────────┤
│                                    │
│  ┌─────────────────────────────┐  │
│  │ [IMG] Cupcake X   R$ 12,50  │  │
│  │       [-] 2 [+]    R$ 25,00 │  │
│  │       🗑️ Remover             │  │
│  └─────────────────────────────┘  │
│                                    │
│  ┌─────────────────────────────┐  │
│  │ [IMG] Cupcake Y   R$ 15,00  │  │
│  │       [-] 1 [+]    R$ 15,00 │  │
│  │       🗑️ Remover             │  │
│  └─────────────────────────────┘  │
│                                    │
├────────────────────────────────────┤
│  Subtotal:           R$ 40,00      │
│                                    │
│  [Continuar Comprando]             │
│  [Finalizar Pedido] ←─ Primário   │
└────────────────────────────────────┘
```

### 3.5 Modal de Produto (Detalhes)

**Estrutura:**
```
┌─────────────────────────────────────────────┐
│                                      [X]    │
│  ┌──────────────┐  Cupcake Red Velvet      │
│  │              │                           │
│  │   [Imagem    │  Deliciosa massa         │
│  │    Grande]   │  vermelha com...         │
│  │              │                           │
│  └──────────────┘  ⭐⭐⭐⭐⭐ (4.8)          │
│                    24 avaliações            │
│  Categoria: Especiais                       │
│  Estoque: 15 unidades                       │
│                                             │
│  R$ 12,50                                   │
│                                             │
│  Quantidade: [-] 1 [+]                      │
│                                             │
│  [Adicionar ao Carrinho] 🛒                 │
│  [❤️ Adicionar aos Favoritos]              │
│                                             │
│  ──── Avaliações ────                       │
│  [Lista de comentários...]                  │
└─────────────────────────────────────────────┘
```

### 3.6 Formulário de Checkout

**Estrutura:**
```
┌────────────────────────────────────────┐
│  Finalizar Pedido                      │
├────────────────────────────────────────┤
│                                        │
│  📍 Endereço de Entrega                │
│  ┌──────────────────────────────────┐ │
│  │ Rua, número, complemento         │ │
│  └──────────────────────────────────┘ │
│                                        │
│  ┌────────────┐                       │
│  │ CEP        │  [Buscar]             │
│  └────────────┘                       │
│                                        │
│  💬 Observações (opcional)             │
│  ┌──────────────────────────────────┐ │
│  │ Ex: Deixar com porteiro          │ │
│  └──────────────────────────────────┘ │
│                                        │
│  ──── Resumo do Pedido ────           │
│                                        │
│  2 itens                               │
│  Subtotal: R$ 40,00                    │
│  Entrega:  R$ 10,00                    │
│  ────────────────────                  │
│  Total:    R$ 50,00                    │
│                                        │
│  [Confirmar Pedido]                    │
└────────────────────────────────────────┘
```

---

## 4. Fluxo de Navegação

### 4.1 Jornada do Cliente

```
[Login/Cadastro]
       ↓
[Home - Catálogo]
       ↓
[Produto Detalhado] ←→ [Adicionar ao Carrinho]
       ↓
[Carrinho]
       ↓
[Checkout]
       ↓
[Confirmação do Pedido]
       ↓
[Acompanhar Pedido]
```

### 4.2 Navegação Administrativa

```
[Dashboard Admin]
       ↓
├─→ [Gestão de Produtos]
│      ├─ Listar
│      ├─ Adicionar
│      └─ Editar
│
├─→ [Gestão de Pedidos]
│      ├─ Listar
│      └─ Atualizar Status
│
└─→ [Relatórios]
       ├─ Vendas
       └─ Avaliações
```

---

## 5. Wireframes das Telas Principais

### 5.1 Home (Catálogo)

**Layout Desktop:**
```
┌──────────────────────────────────────────────────────────────┐
│ [Logo] [────────── Busca ──────────] [🛒2] [❤️] [👤]        │ ← Navbar
├────────┬─────────────────────────────────────────────────────┤
│        │                                                     │
│ Categ  │  🏠 > Todas as Categorias                          │
│ ────   │                                                     │
│ Todas  │  Nossos Cupcakes                                   │
│ Choco  │  ────────────────                                  │
│ Frutas │                                                     │
│ Espec  │  ┌────┐ ┌────┐ ┌────┐ ┌────┐                      │
│        │  │IMG │ │IMG │ │IMG │ │IMG │                      │
│ ────   │  │Red │ │Choc│ │Lim │ │Mor │                      │
│ Perfil │  │Velv│ │olat│ │ão  │ │ang │                      │
│ Pedido │  │R$12│ │R$10│ │R$11│ │R$13│                      │
│ Favor  │  │[+] │ │[+] │ │[+] │ │[+] │                      │
│ Sair   │  └────┘ └────┘ └────┘ └────┘                      │
│        │                                                     │
│        │  ┌────┐ ┌────┐ ┌────┐ ┌────┐                      │
│        │  │IMG │ │IMG │ │IMG │ │IMG │                      │
│        │  │...  │ │...  │ │...  │ │...  │                      │
└────────┴─────────────────────────────────────────────────────┘
```

### 5.2 Página do Produto (Modal ou Dedicada)

```
┌──────────────────────────────────────────────────────────────┐
│ [← Voltar]                                    [🛒2] [❤️] [👤]│
├──────────────────────────────────────────────────────────────┤
│                                                              │
│  ┌──────────────────┐    Cupcake Red Velvet                │
│  │                  │    ═══════════════════                │
│  │                  │                                        │
│  │   IMAGEM GRANDE  │    ⭐⭐⭐⭐⭐ 4.8 (24 avaliações)       │
│  │                  │                                        │
│  │     (500x500)    │    Categoria: Especiais               │
│  │                  │    Disponível: 15 unidades            │
│  │                  │                                        │
│  └──────────────────┘    Deliciosa massa vermelha aveludada│
│                           com cobertura de cream cheese.    │
│                           Ideal para ocasiões especiais!    │
│                                                              │
│                           R$ 12,50                           │
│                           ════════                           │
│                                                              │
│                           Quantidade: [-] 1 [+]              │
│                                                              │
│                           [🛒 Adicionar ao Carrinho]         │
│                           [❤️ Adicionar aos Favoritos]      │
│                                                              │
├──────────────────────────────────────────────────────────────┤
│  Avaliações dos Clientes                                     │
│  ═══════════════════════                                     │
│                                                              │
│  ⭐⭐⭐⭐⭐ Maria Silva - Há 2 dias                           │
│  "Maravilhoso! Super recomendo!"                             │
│                                                              │
│  ⭐⭐⭐⭐ João Santos - Há 1 semana                          │
│  "Muito gostoso, mas achei um pouco caro."                   │
└──────────────────────────────────────────────────────────────┘
```

### 5.3 Meus Pedidos

```
┌──────────────────────────────────────────────────────────────┐
│ [Logo]                                        [🛒2] [❤️] [👤]│
├────────┬─────────────────────────────────────────────────────┤
│        │                                                     │
│ Menu   │  Meus Pedidos                                       │
│        │  ═══════════                                        │
│        │                                                     │
│        │  ┌──────────────────────────────────────────────┐  │
│        │  │ Pedido #12345             🟢 Entregue        │  │
│        │  │ 22/10/2025 - 14:30                           │  │
│        │  │                                              │  │
│        │  │ 2 itens - Total: R$ 50,00                    │  │
│        │  │ [Ver Detalhes]                               │  │
│        │  └──────────────────────────────────────────────┘  │
│        │                                                     │
│        │  ┌──────────────────────────────────────────────┐  │
│        │  │ Pedido #12344             🟡 Em Preparo      │  │
│        │  │ 21/10/2025 - 16:45                           │  │
│        │  │                                              │  │
│        │  │ 3 itens - Total: R$ 75,00                    │  │
│        │  │ [Ver Detalhes] [Cancelar]                    │  │
│        │  └──────────────────────────────────────────────┘  │
└────────┴─────────────────────────────────────────────────────┘
```

### 5.4 Dashboard Admin

```
┌──────────────────────────────────────────────────────────────┐
│ Ed Cupcakes - Admin                              [👤 Admin] │
├────────┬─────────────────────────────────────────────────────┤
│        │                                                     │
│ 📊 Dash│  Dashboard                                          │
│ 🧁 Prod│  ═════════                                          │
│ 📦 Pedi│                                                     │
│ 📈 Rela│  ┌──────────┐ ┌──────────┐ ┌──────────┐           │
│        │  │ Pedidos  │ │ Receita  │ │ Produtos │           │
│        │  │  Hoje    │ │  Mensal  │ │  Ativos  │           │
│        │  │    12    │ │ R$ 3.500 │ │    45    │           │
│        │  └──────────┘ └──────────┘ └──────────┘           │
│        │                                                     │
│        │  Últimos Pedidos                                    │
│        │  ────────────────                                   │
│        │  #12345 - João Silva - R$ 50,00 - 🟡 Preparando   │
│        │  #12344 - Maria Costa - R$ 35,00 - 🟢 Entregue    │
│        │  #12343 - Pedro Lima - R$ 60,00 - 🔵 Enviado      │
│        │                                                     │
│        │  Produtos com Estoque Baixo                         │
│        │  ───────────────────────────                        │
│        │  Cupcake Red Velvet - 3 unidades                   │
│        │  Cupcake Morango - 5 unidades                      │
└────────┴─────────────────────────────────────────────────────┘
```

---

## 6. Interações e Micro-animações

### 6.1 Hover States
- **Cards de Produto:** Elevação de sombra + escala 102%
- **Botões:** Leve escurecimento da cor de fundo
- **Links:** Sublinhado suave com transição

### 6.2 Animações de Feedback
- **Adicionar ao Carrinho:** Badge do carrinho pulsa + número incrementa
- **Favoritar:** Coração preenche com animação de batida
- **Loading:** Spinner roxo com rotação suave
- **Toast Messages:** Deslizam do topo com fade-in

### 6.3 Transições
- **Todas as transições:** 200-300ms com easing ease-in-out
- **Modal/Drawer:** Slide-in de 250ms
- **Troca de Página:** Fade entre 150ms

---

## 7. Mensagens e Feedback ao Usuário

### 7.1 Tipos de Mensagem

**Sucesso (Verde)**
- "✓ Produto adicionado ao carrinho!"
- "✓ Pedido realizado com sucesso! Número: #12345"
- "✓ Perfil atualizado."

**Erro (Vermelho)**
- "✗ E-mail ou senha incorretos."
- "✗ CEP inválido. Por favor, verifique."
- "✗ Produto fora de estoque."

**Aviso (Amarelo)**
- "⚠ Restam apenas 3 unidades deste produto."
- "⚠ Você precisa estar logado para continuar."

**Informação (Azul)**
- "ℹ Seu pedido está em preparo."
- "ℹ Entrega estimada: 2-3 dias úteis."

### 7.2 Estados Vazios

**Carrinho Vazio:**
```
    🛒

    Seu carrinho está vazio

    Que tal começar adicionando alguns
    cupcakes deliciosos?

    [Explorar Produtos]
```

**Sem Favoritos:**
```
    ❤️

    Você ainda não tem favoritos

    Marque seus cupcakes preferidos para
    encontrá-los facilmente depois!

    [Ver Catálogo]
```

**Sem Pedidos:**
```
    📦

    Você ainda não fez nenhum pedido

    Faça seu primeiro pedido e aproveite
    nossos cupcakes gourmet!

    [Começar a Comprar]
```

---

## 8. Anotações para Implementação

### 8.1 Prioridades de Desenvolvimento

**Fase 1 - Essencial (MVP)**
1. ✅ Navbar com logo, busca, carrinho, usuário
2. ✅ Catálogo de produtos em grid responsivo
3. ✅ Card de produto com imagem, título, preço, botão
4. ✅ Modal/página de detalhes do produto
5. ✅ Carrinho funcional (adicionar, remover, ajustar)
6. ✅ Formulário de checkout
7. ✅ Login e cadastro
8. ✅ Página de pedidos

**Fase 2 - Importante**
9. Favoritos funcionais
10. Sistema de avaliações
11. Dashboard admin básico
12. Gestão de produtos (CRUD)
13. Gestão de pedidos (status)

**Fase 3 - Aprimoramentos**
14. Relatórios administrativos
15. Filtros avançados
16. Busca com sugestões
17. Animações e micro-interações

### 8.2 Componentes React a Criar

```
src/components/
├── layout/
│   ├── Navbar.tsx
│   ├── Sidebar.tsx
│   └── Footer.tsx
├── produto/
│   ├── ProdutoCard.tsx
│   ├── ProdutoDetalhes.tsx
│   ├── ProdutoGrid.tsx
│   └── ProdutoFiltros.tsx
├── carrinho/
│   ├── Carrinho.tsx
│   ├── CarrinhoItem.tsx
│   └── CarrinhoResumo.tsx
├── pedido/
│   ├── PedidoCard.tsx
│   ├── PedidoDetalhes.tsx
│   └── PedidoStatus.tsx
├── auth/
│   ├── Login.tsx
│   ├── Cadastro.tsx
│   └── PerfilForm.tsx
├── admin/
│   ├── Dashboard.tsx
│   ├── ProdutoForm.tsx
│   └── PedidoGestao.tsx
└── ui/
    ├── Button.tsx
    ├── Input.tsx
    ├── Card.tsx
    ├── Modal.tsx
    ├── Toast.tsx
    └── Badge.tsx
```

### 8.3 Design Tokens (Tailwind Config)

```javascript
colors: {
  roxo: {
    50: '#F5ECFA',
    500: '#5B2C6F',  // Principal
    600: '#4A2359',
    700: '#7C3A99', // Hover
  },
  verde: {
    500: '#145A32',
    600: '#0F4423',
  }
},
fontFamily: {
  heading: ['Poppins', 'sans-serif'],
  body: ['Inter', 'sans-serif'],
}
```

---

## 9. Referências de Inspiração

### Design Similar ao iFood:
- Layout em grid de cards
- Navbar fixa no topo
- Sidebar de categorias
- Cards com imagens grandes
- Cores vibrantes mas profissionais
- Micro-interações ao adicionar ao carrinho
- Badge de quantidade no carrinho

### Diferencial do Ed Cupcakes:
- Paleta roxo + verde (em vez de vermelho)
- Foco em produtos gourmet (imagens premium)
- Design mais sofisticado e clean
- Menos informação visual competindo por atenção
