# Ed Cupcakes - Mapa de Afinidade

## 1. O que é um Mapa de Afinidade?

O **Mapa de Afinidade** (Affinity Mapping) é uma técnica de organização que agrupa User Stories relacionadas em categorias lógicas. Isso ajuda a:
- Visualizar a arquitetura do sistema
- Identificar padrões e relacionamentos
- Priorizar funcionalidades por área
- Planejar sprints de forma coesa

---

## 2. Metodologia Aplicada

1. **Levantamento:** Criamos 35 User Stories
2. **Agrupamento:** Organizamos em 6 Épicos principais
3. **Afinidade:** Identificamos sub-temas dentro de cada épico
4. **Priorização:** Aplicamos método MoSCoW
5. **Estimativa:** Usamos Planning Poker (Fibonacci)

---

## 3. Mapa Visual de Afinidade

```
┌────────────────────────────────────────────────────────────────────────────┐
│                        ED CUPCAKES - MAPA DE AFINIDADE                      │
└────────────────────────────────────────────────────────────────────────────┘

┌─────────────────────────┐  ┌─────────────────────────┐  ┌─────────────────────────┐
│  🛍️ VITRINE VIRTUAL     │  │  🛒 GESTÃO DE PEDIDOS   │  │  💳 PAGAMENTO           │
│  (EP01)                 │  │  (EP02)                 │  │  (EP03)                 │
│                         │  │                         │  │                         │
│  Navegação & Descoberta │  │  Carrinho de Compras    │  │  Métodos de Pagamento   │
│  ├─ US01: Ver Catálogo  │  │  ├─ US07: Adicionar     │  │  ├─ US16: Escolher     │
│  ├─ US02: Filtrar       │  │  ├─ US08: Visualizar    │  │  ├─ US17: PIX          │
│  ├─ US03: Buscar        │  │  ├─ US09: Alterar Qtd   │  │  ├─ US18: Cartão       │
│  ├─ US04: Ver Detalhes  │  │  ├─ US10: Remover       │  │  ├─ US19: Dinheiro     │
│  ├─ US05: Destaques     │  │  └─ US11: Observações   │  │  └─ US20: Comprovante  │
│  └─ US06: Avaliações    │  │                         │  │                         │
│                         │  │  Processo de Checkout   │  │                         │
│  Story Points: 24       │  │  ├─ US12: Finalizar     │  │  Story Points: 44       │
│  Prioridade: ALTA       │  │  ├─ US15: Cancelar      │  │  Prioridade: ALTA       │
└─────────────────────────┘  │                         │  └─────────────────────────┘
                             │  Acompanhamento         │
                             │  ├─ US13: Meus Pedidos  │
                             │  └─ US14: Detalhes      │
                             │                         │
                             │  Story Points: 43       │
                             │  Prioridade: ALTA       │
                             └─────────────────────────┘

┌─────────────────────────┐  ┌─────────────────────────┐  ┌─────────────────────────┐
│  🚚 ENTREGA             │  │  👤 CONTA DO CLIENTE    │  │  ⚙️ GESTÃO ADMIN        │
│  (EP04)                 │  │  (EP05)                 │  │  (EP06)                 │
│                         │  │                         │  │                         │
│  Logística              │  │  Autenticação           │  │  Produtos               │
│  ├─ US21: Calc Frete    │  │  ├─ US26: Criar Conta   │  │  └─ US32: Gerenciar    │
│  ├─ US22: Horário       │  │  ├─ US27: Login         │  │                         │
│  ├─ US25: Reagendar     │  │  └─ US28: Recuperar     │  │  Pedidos                │
│  └─ US24: Confirmar     │  │                         │  │  └─ US33: Gerenciar    │
│                         │  │  Personalização         │  │                         │
│  Rastreamento           │  │  ├─ US29: Editar Perfil │  │  Controles              │
│  └─ US23: Acompanhar    │  │  ├─ US30: Favoritos     │  │  ├─ US34: Relatórios   │
│                         │  │  └─ US31: Avaliar       │  │  └─ US35: Estoque      │
│  Story Points: 29       │  │                         │  │                         │
│  Prioridade: ALTA       │  │  Story Points: 28       │  │  Story Points: 29       │
└─────────────────────────┘  │  Prioridade: ALTA       │  │  Prioridade: MÉDIA      │
                             └─────────────────────────┘  └─────────────────────────┘
```

---

## 4. Agrupamento por Temas e Sub-temas

### 🛍️ ÉPICO 01: VITRINE VIRTUAL (24 pts)

#### Sub-tema 1.1: Navegação e Descoberta
**Objetivo:** Permitir que o cliente encontre cupcakes facilmente

| ID | História | Prioridade | Pontos |
|----|----------|------------|--------|
| US01 | Visualizar Catálogo de Cupcakes | Alta | 5 |
| US02 | Filtrar Cupcakes por Categoria | Alta | 3 |
| US03 | Buscar Cupcakes por Nome | Média | 3 |
| US05 | Visualizar Cupcakes em Destaque | Média | 3 |

**Subtotal:** 14 pontos

#### Sub-tema 1.2: Informações do Produto
**Objetivo:** Fornecer informações completas para decisão de compra

| ID | História | Prioridade | Pontos |
|----|----------|------------|--------|
| US04 | Ver Detalhes do Cupcake | Alta | 5 |
| US06 | Ver Avaliações de Clientes | Média | 5 |

**Subtotal:** 10 pontos

---

### 🛒 ÉPICO 02: GESTÃO DE PEDIDOS (43 pts)

#### Sub-tema 2.1: Carrinho de Compras
**Objetivo:** Permitir acumular produtos antes da finalização

| ID | História | Prioridade | Pontos |
|----|----------|------------|--------|
| US07 | Adicionar Cupcake ao Carrinho | Alta | 5 |
| US08 | Visualizar Carrinho de Compras | Alta | 5 |
| US09 | Alterar Quantidade no Carrinho | Alta | 3 |
| US10 | Remover Item do Carrinho | Alta | 2 |
| US11 | Adicionar Observações ao Pedido | Média | 2 |

**Subtotal:** 17 pontos

#### Sub-tema 2.2: Checkout
**Objetivo:** Concluir a compra de forma simples e segura

| ID | História | Prioridade | Pontos |
|----|----------|------------|--------|
| US12 | Finalizar Pedido (Checkout) | Alta | 8 |
| US15 | Cancelar Pedido Pendente | Média | 3 |

**Subtotal:** 11 pontos

#### Sub-tema 2.3: Acompanhamento de Pedidos
**Objetivo:** Permitir que o cliente veja histórico e status

| ID | História | Prioridade | Pontos |
|----|----------|------------|--------|
| US13 | Visualizar Meus Pedidos | Alta | 5 |
| US14 | Ver Detalhes de um Pedido Específico | Alta | 5 |

**Subtotal:** 10 pontos + 5 pontos (cancelamento) = **15 pontos**

---

### 💳 ÉPICO 03: PAGAMENTO (44 pts)

#### Sub-tema 3.1: Métodos de Pagamento
**Objetivo:** Oferecer múltiplas formas de pagamento convenientes

| ID | História | Prioridade | Pontos |
|----|----------|------------|--------|
| US16 | Escolher Forma de Pagamento | Alta | 8 |
| US17 | Processar Pagamento via PIX | Alta | 13 |
| US18 | Processar Pagamento com Cartão | Média | 13 |
| US19 | Confirmar Pagamento em Dinheiro | Média | 5 |

**Subtotal:** 39 pontos

#### Sub-tema 3.2: Comprovantes
**Objetivo:** Fornecer documentação das transações

| ID | História | Prioridade | Pontos |
|----|----------|------------|--------|
| US20 | Receber Comprovante de Pagamento | Baixa | 5 |

**Subtotal:** 5 pontos

---

### 🚚 ÉPICO 04: ENTREGA (29 pts)

#### Sub-tema 4.1: Logística de Entrega
**Objetivo:** Calcular frete e agendar entregas

| ID | História | Prioridade | Pontos |
|----|----------|------------|--------|
| US21 | Calcular Frete por CEP | Alta | 8 |
| US22 | Escolher Horário de Entrega | Média | 5 |
| US25 | Reagendar Entrega | Baixa | 5 |

**Subtotal:** 18 pontos

#### Sub-tema 4.2: Rastreamento
**Objetivo:** Permitir acompanhamento em tempo real

| ID | História | Prioridade | Pontos |
|----|----------|------------|--------|
| US23 | Acompanhar Status da Entrega | Alta | 8 |
| US24 | Confirmar Recebimento | Média | 3 |

**Subtotal:** 11 pontos

---

### 👤 ÉPICO 05: CONTA DO CLIENTE (28 pts)

#### Sub-tema 5.1: Autenticação e Acesso
**Objetivo:** Controlar acesso e segurança da conta

| ID | História | Prioridade | Pontos |
|----|----------|------------|--------|
| US26 | Criar Conta de Cliente | Alta | 5 |
| US27 | Fazer Login | Alta | 5 |
| US28 | Recuperar Senha | Média | 5 |

**Subtotal:** 15 pontos

#### Sub-tema 5.2: Personalização
**Objetivo:** Permitir que cliente personalize sua experiência

| ID | História | Prioridade | Pontos |
|----|----------|------------|--------|
| US29 | Editar Perfil | Média | 3 |
| US30 | Adicionar aos Favoritos | Média | 5 |
| US31 | Avaliar Produto Comprado | Média | 5 |

**Subtotal:** 13 pontos

---

### ⚙️ ÉPICO 06: GESTÃO ADMINISTRATIVA (29 pts)

#### Sub-tema 6.1: Gestão de Catálogo
**Objetivo:** Admin gerencia produtos da loja

| ID | História | Prioridade | Pontos |
|----|----------|------------|--------|
| US32 | Gerenciar Produtos (Admin) | Alta | 8 |
| US35 | Gerenciar Estoque (Admin) | Alta | 5 |

**Subtotal:** 13 pontos

#### Sub-tema 6.2: Operações
**Objetivo:** Admin gerencia pedidos e vendas

| ID | História | Prioridade | Pontos |
|----|----------|------------|--------|
| US33 | Gerenciar Pedidos (Admin) | Alta | 8 |
| US34 | Visualizar Relatórios de Vendas (Admin) | Baixa | 8 |

**Subtotal:** 16 pontos

---

## 5. Análise de Dependências

### Fluxo de Dependências Críticas

```
┌──────────────────┐
│  US26: Criar     │
│  Conta           │
└────────┬─────────┘
         │
         ▼
┌──────────────────┐
│  US27: Login     │
└────────┬─────────┘
         │
         ▼
┌──────────────────┐     ┌──────────────────┐
│  US01: Catálogo  │────▶│  US04: Detalhes  │
└────────┬─────────┘     └────────┬─────────┘
         │                        │
         ▼                        ▼
┌──────────────────┐     ┌──────────────────┐
│  US07: Add       │────▶│  US08: Ver       │
│  Carrinho        │     │  Carrinho        │
└────────┬─────────┘     └────────┬─────────┘
         │                        │
         ▼                        ▼
┌──────────────────┐     ┌──────────────────┐
│  US12: Checkout  │────▶│  US21: Frete     │
└────────┬─────────┘     └──────────────────┘
         │
         ▼
┌──────────────────┐
│  US16: Pagamento │
└────────┬─────────┘
         │
         ▼
┌──────────────────┐
│  US23: Status    │
│  Entrega         │
└────────┬─────────┘
         │
         ▼
┌──────────────────┐
│  US24: Confirmar │
│  Recebimento     │
└────────┬─────────┘
         │
         ▼
┌──────────────────┐
│  US31: Avaliar   │
└──────────────────┘
```

### Grupos de Dependência

#### Grupo 1: Fundação (Pré-requisitos)
- **US26** (Criar Conta) → Sem dependências
- **US27** (Login) → Depende de US26
- **US01** (Catálogo) → Sem dependências

#### Grupo 2: Descoberta de Produtos
- **US02** (Filtrar) → Depende de US01
- **US03** (Buscar) → Depende de US01
- **US04** (Detalhes) → Depende de US01
- **US05** (Destaques) → Depende de US01
- **US06** (Avaliações) → Depende de US04

#### Grupo 3: Carrinho
- **US07** (Adicionar) → Depende de US01, US04
- **US08** (Visualizar) → Depende de US07
- **US09** (Alterar Qtd) → Depende de US08
- **US10** (Remover) → Depende de US08
- **US11** (Observações) → Depende de US08

#### Grupo 4: Checkout e Pagamento
- **US12** (Checkout) → Depende de US08, US27
- **US21** (Frete) → Depende de US12
- **US16** (Escolher Pagamento) → Depende de US12
- **US17-19** (Processar Pagamento) → Depende de US16

#### Grupo 5: Pós-Compra
- **US13** (Meus Pedidos) → Depende de US12, US27
- **US14** (Detalhes Pedido) → Depende de US13
- **US23** (Status Entrega) → Depende de US12
- **US24** (Confirmar) → Depende de US23
- **US31** (Avaliar) → Depende de US24

#### Grupo 6: Recursos Adicionais
- **US30** (Favoritos) → Depende de US27, US01
- **US29** (Editar Perfil) → Depende de US27
- **US15** (Cancelar) → Depende de US13

#### Grupo 7: Admin (Independente)
- **US32-35** → Requerem autenticação admin mas são independentes entre si

---

## 6. Matriz de Priorização (Valor x Esforço)

```
ALTO VALOR, BAIXO ESFORÇO          │  ALTO VALOR, ALTO ESFORÇO
(Quick Wins - Prioridade Máxima)   │  (Projetos Estratégicos)
────────────────────────────────────┼────────────────────────────────────
• US01: Catálogo (5pts) ⭐          │ • US12: Checkout (8pts) ⭐
• US07: Add Carrinho (5pts) ⭐      │ • US17: PIX (13pts) ⭐
• US08: Ver Carrinho (5pts) ⭐      │ • US18: Cartão (13pts)
• US26: Criar Conta (5pts) ⭐       │ • US21: Calc Frete (8pts) ⭐
• US27: Login (5pts) ⭐             │ • US23: Status Entrega (8pts) ⭐
• US10: Remover (2pts) ⭐           │ • US32: Ger. Produtos (8pts) ⭐
• US09: Alterar Qtd (3pts) ⭐       │ • US33: Ger. Pedidos (8pts) ⭐
────────────────────────────────────┼────────────────────────────────────
BAIXO VALOR, BAIXO ESFORÇO         │  BAIXO VALOR, ALTO ESFORÇO
(Oportunidades)                     │  (Baixa Prioridade)
────────────────────────────────────┼────────────────────────────────────
• US02: Filtrar (3pts)              │ • US34: Relatórios (8pts)
• US11: Observações (2pts)          │ • US25: Reagendar (5pts)
• US24: Confirmar Receb (3pts)      │ • US20: Comprovante (5pts)
• US29: Editar Perfil (3pts)        │
────────────────────────────────────┼────────────────────────────────────

⭐ = Itens do MVP (Minimum Viable Product)
```

---

## 7. Análise por Persona

### Persona 1: Cliente Final (Comprador)
**User Stories que atendem:** 26 histórias (US01-US31)

**Jornada do Cliente:**
1. **Descoberta:** US01, US02, US03, US05
2. **Avaliação:** US04, US06
3. **Decisão:** US07, US30
4. **Compra:** US08-US12
5. **Pagamento:** US16-US20
6. **Entrega:** US21-US25
7. **Pós-venda:** US13, US14, US31

### Persona 2: Administrador
**User Stories que atendem:** 4 histórias (US32-US35)

**Jornada do Admin:**
1. **Gestão de Catálogo:** US32, US35
2. **Operações:** US33
3. **Análise:** US34

---

## 8. Grupos para Sprints Sugeridos

### Sprint 0 (Preparação) - 0 pontos
- Setup de projeto
- Configuração de banco
- Estrutura base

### Sprint 1 (Fundação) - 23 pontos
- US26: Criar Conta (5)
- US27: Login (5)
- US01: Catálogo (5)
- US04: Detalhes (5)
- US09: Alterar Qtd (3)

### Sprint 2 (Carrinho) - 22 pontos
- US07: Adicionar (5)
- US08: Visualizar (5)
- US10: Remover (2)
- US02: Filtrar (3)
- US03: Buscar (3)
- US11: Observações (2)
- US10: Remover (2)

### Sprint 3 (Checkout) - 21 pontos
- US12: Checkout (8)
- US21: Frete (8)
- US13: Meus Pedidos (5)

### Sprint 4 (Pagamento) - 26 pontos
- US16: Escolher (8)
- US17: PIX (13)
- US19: Dinheiro (5)

### Sprint 5 (Entrega) - 19 pontos
- US23: Status (8)
- US14: Detalhes Pedido (5)
- US22: Horário (5)
- US15: Cancelar (3)

### Sprint 6 (Admin) - 21 pontos
- US32: Ger. Produtos (8)
- US33: Ger. Pedidos (8)
- US35: Estoque (5)

### Sprint 7 (Melhorias) - 23 pontos
- US06: Avaliações (5)
- US30: Favoritos (5)
- US31: Avaliar (5)
- US28: Recuperar Senha (5)
- US29: Editar Perfil (3)

### Sprint 8 (Complementos) - 29 pontos
- US18: Cartão (13)
- US05: Destaques (3)
- US24: Confirmar (3)
- US34: Relatórios (8)
- US20: Comprovante (5)
- US25: Reagendar (5)

---

## 9. Insights do Mapa de Afinidade

### Descobertas Importantes

1. **Concentração de Valor:** 60% das histórias são de prioridade Alta
2. **Complexidade de Pagamento:** Épico com maior pontuação (44 pts)
3. **Interdependências:** Carrinho é hub central (conecta 8 histórias)
4. **MVP Viável:** Sprints 1-3 entregam funcionalidade completa de compra

### Riscos Identificados

⚠️ **Risco 1:** Integração de pagamento (US17, US18) são complexas (13 pts cada)
⚠️ **Risco 2:** Checkout (US12) tem muitas validações (CEP, endereço)
⚠️ **Risco 3:** Sistema de notificações (e-mail) atravessa múltiplos épicos

### Oportunidades

✅ **Quick Wins:** 7 histórias de alta prioridade e baixo esforço
✅ **Modularidade:** Épicos são independentes (podem ser desenvolvidos em paralelo)
✅ **Escalabilidade:** Favoritos e Avaliações podem ser fase 2

---

**Documento criado em:** 22/10/2025
**Versão:** 1.0
**Status:** ✅ Validado
