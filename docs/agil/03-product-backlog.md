# Ed Cupcakes - Product Backlog Priorizado

## 1. Introdução

Este documento apresenta o **Product Backlog** completo e priorizado para o projeto Ed Cupcakes. O backlog está ordenado por valor de negócio, considerando:

- **Valor para o Cliente**
- **Risco Técnico**
- **Dependências**
- **Custo de Implementação**
- **Urgência de Mercado**

---

## 2. Critérios de Priorização

### Método MoSCoW

- **Must Have (M):** Funcionalidades essenciais para o MVP
- **Should Have (S):** Importantes mas não bloqueiam o lançamento
- **Could Have (C):** Desejáveis para versões futuras
- **Won't Have (W):** Fora do escopo atual

### Fatores de Priorização

1. **Valor de Negócio:** 40%
2. **Urgência (Time-to-Market):** 30%
3. **Risco Técnico:** 20%
4. **Dependências:** 10%

---

## 3. Product Backlog Priorizado

### 🔴 PRIORIDADE CRÍTICA (Release 1.0 - MVP)

| Rank | ID | História | Épico | MoSCoW | Pontos | Sprint | Justificativa |
|------|----|----------|-------|--------|--------|--------|---------------|
| 1 | US26 | Criar Conta de Cliente | EP05 | M | 5 | 1 | Pré-requisito para todo o sistema |
| 2 | US27 | Fazer Login | EP05 | M | 5 | 1 | Pré-requisito para compras |
| 3 | US01 | Visualizar Catálogo de Cupcakes | EP01 | M | 5 | 1 | Core da loja - sem isso não há venda |
| 4 | US04 | Ver Detalhes do Cupcake | EP01 | M | 5 | 1 | Decisão de compra depende de informações |
| 5 | US07 | Adicionar Cupcake ao Carrinho | EP02 | M | 5 | 2 | Funcionalidade central de e-commerce |
| 6 | US08 | Visualizar Carrinho de Compras | EP02 | M | 5 | 2 | Cliente precisa revisar antes de comprar |
| 7 | US09 | Alterar Quantidade no Carrinho | EP02 | M | 3 | 2 | UX básica de carrinho |
| 8 | US10 | Remover Item do Carrinho | EP02 | M | 2 | 2 | UX básica de carrinho |
| 9 | US12 | Finalizar Pedido (Checkout) | EP02 | M | 8 | 3 | Conversão - momento crítico |
| 10 | US21 | Calcular Frete por CEP | EP04 | M | 8 | 3 | Necessário para precificar pedido |
| 11 | US16 | Escolher Forma de Pagamento | EP03 | M | 8 | 4 | Sem pagamento não há venda |
| 12 | US17 | Processar Pagamento via PIX | EP03 | M | 13 | 4 | Método preferido no Brasil (2024) |
| 13 | US13 | Visualizar Meus Pedidos | EP02 | M | 5 | 3 | Cliente precisa acompanhar compras |
| 14 | US23 | Acompanhar Status da Entrega | EP04 | M | 8 | 5 | Reduz ansiedade e ligações de suporte |
| 15 | US32 | Gerenciar Produtos (Admin) | EP06 | M | 8 | 6 | Admin precisa cadastrar cupcakes |
| 16 | US35 | Gerenciar Estoque (Admin) | EP06 | M | 5 | 6 | Evitar vender produtos esgotados |
| 17 | US33 | Gerenciar Pedidos (Admin) | EP06 | M | 8 | 6 | Admin precisa processar pedidos |

**Total MVP:** 17 histórias | 106 story points | ~6 sprints

---

### 🟡 PRIORIDADE ALTA (Release 1.1)

| Rank | ID | História | Épico | MoSCoW | Pontos | Sprint | Justificativa |
|------|----|----------|-------|--------|--------|--------|---------------|
| 18 | US02 | Filtrar Cupcakes por Categoria | EP01 | S | 3 | 2 | Melhora descoberta de produtos |
| 19 | US03 | Buscar Cupcakes por Nome | EP01 | S | 3 | 2 | UX importante para retorno |
| 20 | US14 | Ver Detalhes de um Pedido | EP02 | S | 5 | 5 | Transparência para o cliente |
| 21 | US19 | Pagamento em Dinheiro na Entrega | EP03 | S | 5 | 4 | Opção popular para clientes sem cartão |
| 22 | US28 | Recuperar Senha | EP05 | S | 5 | 7 | Evita perda de clientes que esqueceram senha |
| 23 | US22 | Escolher Horário de Entrega | EP04 | S | 5 | 5 | Conveniência para o cliente |
| 24 | US11 | Adicionar Observações ao Pedido | EP02 | S | 2 | 2 | Personalização (diferencial competitivo) |
| 25 | US15 | Cancelar Pedido Pendente | EP02 | S | 3 | 5 | Flexibilidade para o cliente |

**Total Release 1.1:** 8 histórias | 31 story points | 2 sprints adicionais

---

### 🟢 PRIORIDADE MÉDIA (Release 1.2)

| Rank | ID | História | Épico | MoSCoW | Pontos | Sprint | Justificativa |
|------|----|----------|-------|--------|--------|--------|---------------|
| 26 | US06 | Ver Avaliações de Clientes | EP01 | S | 5 | 7 | Prova social aumenta conversão |
| 27 | US30 | Adicionar aos Favoritos | EP05 | S | 5 | 7 | Retenção e recorrência |
| 28 | US31 | Avaliar Produto Comprado | EP05 | S | 5 | 7 | Gera conteúdo e engajamento |
| 29 | US05 | Visualizar Cupcakes em Destaque | EP01 | S | 3 | 8 | Marketing e promoções |
| 30 | US29 | Editar Perfil | EP05 | S | 3 | 7 | Manter dados atualizados |
| 31 | US24 | Confirmar Recebimento | EP04 | S | 3 | 8 | Finaliza ciclo do pedido |
| 32 | US18 | Processar Pagamento com Cartão | EP03 | C | 13 | 8 | Opção adicional (PIX já cobre) |

**Total Release 1.2:** 7 histórias | 37 story points | 2 sprints adicionais

---

### 🔵 PRIORIDADE BAIXA (Release 2.0)

| Rank | ID | História | Épico | MoSCoW | Pontos | Sprint | Justificativa |
|------|----|----------|-------|--------|--------|--------|---------------|
| 33 | US34 | Visualizar Relatórios de Vendas | EP06 | C | 8 | 8 | BI - importante mas não urgente |
| 34 | US20 | Receber Comprovante de Pagamento | EP03 | C | 5 | 8 | Nice-to-have |
| 35 | US25 | Reagendar Entrega | EP04 | C | 5 | 8 | Feature avançada |

**Total Release 2.0:** 3 histórias | 18 story points | 1 sprint

---

## 4. Roadmap de Releases

```
┌─────────────────────────────────────────────────────────────────────────┐
│                           ROADMAP ED CUPCAKES                            │
└─────────────────────────────────────────────────────────────────────────┘

Sprint 0 ──────────────────▶ Setup & Infraestrutura
         (2 semanas)

┌─────────────────────────────────────────────────────────────────────────┐
│  RELEASE 1.0 - MVP (Minimum Viable Product)                              │
│  Objetivo: Permitir venda online básica                                 │
└─────────────────────────────────────────────────────────────────────────┘

Sprint 1 ──────────────────▶ Autenticação + Catálogo
│        (2 semanas)        US26, US27, US01, US04
│
Sprint 2 ──────────────────▶ Carrinho de Compras
│        (2 semanas)        US07, US08, US09, US10, US02, US03, US11
│
Sprint 3 ──────────────────▶ Checkout + Meus Pedidos
│        (2 semanas)        US12, US21, US13
│
Sprint 4 ──────────────────▶ Pagamento PIX + Dinheiro
│        (3 semanas)        US16, US17, US19
│
Sprint 5 ──────────────────▶ Entrega + Status
│        (2 semanas)        US23, US14, US22, US15
│
Sprint 6 ──────────────────▶ Admin
         (2 semanas)        US32, US33, US35

┌─────────────────────────────────────────────────────────────────────────┐
│  🚀 LANÇAMENTO MVP - Semana 15                                          │
│  Funcionalidades: Compra, Pagamento (PIX/Dinheiro), Entrega, Admin     │
└─────────────────────────────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────────────────────────────┐
│  RELEASE 1.2 - Engajamento                                              │
│  Objetivo: Aumentar retenção e prova social                            │
└─────────────────────────────────────────────────────────────────────────┘

Sprint 7 ──────────────────▶ Favoritos + Avaliações
│        (2 semanas)        US06, US30, US31, US28, US29
│
Sprint 8 ──────────────────▶ Cartão + Relatórios
         (3 semanas)        US18, US05, US24, US34, US20, US25

┌─────────────────────────────────────────────────────────────────────────┐
│  🚀 LANÇAMENTO COMPLETO - Semana 25                                     │
└─────────────────────────────────────────────────────────────────────────┘
```

---

## 5. Backlog por Sprint Detalhado

### Sprint 1: Fundação (Semanas 1-2) - 23 pontos

**Objetivo:** Criar base de autenticação e visualização de produtos

| ID | História | Pontos | Critério de Aceite | Status |
|----|----------|--------|--------------------|--------|
| US26 | Criar Conta | 5 | Cliente pode se registrar com sucesso | 🔲 |
| US27 | Login | 5 | Cliente pode fazer login e ver área autenticada | 🔲 |
| US01 | Catálogo | 5 | Exibe todos cupcakes ativos em grid responsivo | 🔲 |
| US04 | Detalhes | 5 | Modal com informações completas do produto | 🔲 |
| US09 | Alterar Qtd | 3 | Botões +/- funcionam e recalculam valores | 🔲 |

**Entregável:** Sistema com login funcional e catálogo navegável

**Riscos:**
- ⚠️ Integração Supabase Auth pode ter curva de aprendizado

**Dependências Externas:**
- Supabase Auth configurado
- Banco de dados com dados de exemplo

---

### Sprint 2: Carrinho (Semanas 3-4) - 22 pontos

**Objetivo:** Implementar carrinho de compras completo

| ID | História | Pontos | Critério de Aceite | Status |
|----|----------|--------|--------------------|--------|
| US07 | Adicionar | 5 | Produto é adicionado ao carrinho com feedback | 🔲 |
| US08 | Visualizar | 5 | Modal/drawer mostra todos itens e total | 🔲 |
| US10 | Remover | 2 | Item é removido com confirmação | 🔲 |
| US02 | Filtrar | 3 | Sidebar filtra por categoria instantaneamente | 🔲 |
| US03 | Buscar | 3 | Campo de busca filtra em tempo real | 🔲 |
| US11 | Observações | 2 | Campo de texto salva observações no pedido | 🔲 |

**Entregável:** Carrinho funcional com UX completa

**Riscos:**
- ⚠️ Gerenciamento de estado do carrinho (Zustand)

---

### Sprint 3: Checkout (Semanas 5-6) - 21 pontos

**Objetivo:** Permitir finalização de pedidos

| ID | História | Pontos | Critério de Aceite | Status |
|----|----------|--------|--------------------|--------|
| US12 | Checkout | 8 | Formulário valida dados e cria pedido | 🔲 |
| US21 | Frete | 8 | API ViaCEP valida CEP e calcula frete | 🔲 |
| US13 | Meus Pedidos | 5 | Lista todos pedidos do usuário ordenados | �� |

**Entregável:** Fluxo de checkout até a tela de pagamento

**Riscos:**
- ⚠️ Integração API ViaCEP (rate limits)
- ⚠️ Cálculo de frete precisa de tabela de preços

**Dependências Externas:**
- API ViaCEP
- Regras de frete definidas

---

### Sprint 4: Pagamento (Semanas 7-9) - 26 pontos

**Objetivo:** Processar pagamentos PIX e Dinheiro

| ID | História | Pontos | Critério de Aceite | Status |
|----|----------|--------|--------------------|--------|
| US16 | Escolher Pagamento | 8 | 3 opções visíveis e selecionáveis | 🔲 |
| US17 | PIX | 13 | QR Code gerado, pagamento detectado automaticamente | 🔲 |
| US19 | Dinheiro | 5 | Opção registrada, pedido confirmado pendente | 🔲 |

**Entregável:** Sistema de pagamento funcional (PIX prioritário)

**Riscos:**
- 🔴 **CRÍTICO:** Integração PIX (MercadoPago, PagSeguro, etc.)
- ⚠️ Complexidade de webhooks para confirmação

**Dependências Externas:**
- Conta em gateway de pagamento
- Credenciais de API (sandbox)

---

### Sprint 5: Entrega (Semanas 10-11) - 19 pontos

**Objetivo:** Rastreamento e gestão de entregas

| ID | História | Pontos | Critério de Aceite | Status |
|----|----------|--------|--------------------|--------|
| US23 | Status Entrega | 8 | 6 status visíveis com datas e cores | 🔲 |
| US14 | Detalhes Pedido | 5 | Página mostra todos dados do pedido | 🔲 |
| US22 | Horário | 5 | Cliente escolhe período de entrega | 🔲 |
| US15 | Cancelar | 3 | Botão cancela pedidos pendentes | 🔲 |

**Entregável:** Acompanhamento completo de pedidos

**Riscos:**
- ⚠️ Sistema de notificação por e-mail precisa estar pronto

---

### Sprint 6: Admin (Semanas 12-13) - 21 pontos

**Objetivo:** Painel administrativo funcional

| ID | História | Pontos | Critério de Aceite | Status |
|----|----------|--------|--------------------|--------|
| US32 | Ger. Produtos | 8 | CRUD completo com upload de imagem | 🔲 |
| US33 | Ger. Pedidos | 8 | Admin visualiza e atualiza status | 🔲 |
| US35 | Estoque | 5 | Estoque atualiza automaticamente | 🔲 |

**Entregável:** Admin consegue operar a loja

**Riscos:**
- ⚠️ Upload de imagens (Supabase Storage)
- ⚠️ Autorização (RLS para admins)

---

### ✅ CHECKPOINT MVP - Semana 14

**Validação:**
- [ ] Cliente consegue se cadastrar e fazer login
- [ ] Cliente consegue navegar catálogo e ver detalhes
- [ ] Cliente consegue adicionar ao carrinho e finalizar pedido
- [ ] Cliente consegue pagar via PIX
- [ ] Cliente consegue acompanhar status do pedido
- [ ] Admin consegue gerenciar produtos e pedidos
- [ ] Sistema está deployado e acessível

**Decisão:** Go/No-Go para lançamento

---

### Sprint 7: Engajamento (Semanas 15-16) - 23 pontos

**Objetivo:** Features de retenção

| ID | História | Pontos | Status |
|----|----------|--------|--------|
| US06 | Avaliações | 5 | 🔲 |
| US30 | Favoritos | 5 | 🔲 |
| US31 | Avaliar | 5 | 🔲 |
| US28 | Recuperar Senha | 5 | 🔲 |
| US29 | Editar Perfil | 3 | 🔲 |

---

### Sprint 8: Complementos (Semanas 17-19) - 29 pontos

**Objetivo:** Features avançadas

| ID | História | Pontos | Status |
|----|----------|--------|--------|
| US18 | Cartão | 13 | 🔲 |
| US05 | Destaques | 3 | 🔲 |
| US24 | Confirmar | 3 | 🔲 |
| US34 | Relatórios | 8 | 🔲 |
| US20 | Comprovante | 5 | 🔲 |
| US25 | Reagendar | 5 | 🔲 |

---

## 6. Definition of Ready (DoR)

Uma história está pronta para desenvolvimento quando:

- [ ] Critérios de aceitação estão claros e testáveis
- [ ] Design/wireframes estão aprovados (se aplicável)
- [ ] Dependências técnicas foram identificadas
- [ ] Estimativa foi validada pela equipe
- [ ] Não há bloqueadores conhecidos

---

## 7. Definition of Done (DoD)

Uma história é considerada completa quando:

- [ ] Código implementado e revisado (code review)
- [ ] Testes unitários escritos e passando
- [ ] Testes de integração (se aplicável)
- [ ] Critérios de aceitação validados
- [ ] Documentação atualizada
- [ ] Deploy em ambiente de staging
- [ ] Aprovação do Product Owner

---

## 8. Métricas de Sucesso

### Por Release

**Release 1.0 (MVP):**
- Taxa de conversão checkout > 3%
- Tempo médio de checkout < 3 minutos
- Taxa de abandono de carrinho < 70%
- 90% dos pedidos processados com sucesso

**Release 1.1:**
- 20% dos clientes usam favoritos
- Taxa de avaliação: 5% dos pedidos entregues
- 10% de clientes recorrentes

**Release 1.2:**
- NPS > 50
- Ticket médio aumenta 15%
- Admin economiza 30% do tempo em gestão

---

## 9. Backlog Grooming

### Cadência
- **Refinamento semanal:** Toda quinta-feira, 2h
- **Planning:** Primeiro dia de cada sprint
- **Retrospectiva:** Último dia de cada sprint

### Responsabilidades
- **Product Owner:** Prioriza e esclarece histórias
- **Tech Lead:** Valida viabilidade técnica
- **Time:** Estima e identifica riscos

---

## 10. Critérios de Repriorização

O backlog pode ser repriorizado se:

1. **Feedback de clientes:** Demanda urgente identificada
2. **Bloqueio técnico:** História não pode ser implementada
3. **Mudança de mercado:** Concorrente lançou feature crítica
4. **Risco de negócio:** Conversão abaixo do esperado

**Aprovação necessária:** Product Owner + Stakeholder

---

**Documento criado em:** 22/10/2025
**Versão:** 1.0
**Próxima revisão:** Após Sprint 2
**Status:** ✅ Aprovado pela equipe
