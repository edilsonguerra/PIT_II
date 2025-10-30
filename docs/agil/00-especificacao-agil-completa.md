# Ed Cupcakes - Especificação Ágil Completa
## Situação-Problema 1: Análise e Levantamento de Requisitos

---

## 📋 Sumário Executivo

**Projeto:** Loja Virtual de Cupcakes Gourmet - Ed Cupcakes
**Cliente:** Proprietário de loja de cupcakes gourmet
**Objetivo:** Desenvolver aplicação web mobile-first para vendas online
**Metodologia:** Scrum com práticas ágeis
**Data:** 22/10/2025

### Contexto do Negócio

O cliente possui uma loja física de cupcakes gourmet e deseja expandir para o mercado digital. Após experiência negativa com fornecedor anterior (requisitos mal elicitados, sistema não funcional), o cliente exige abordagem cautelosa e validação constante.

### Oportunidade de Mercado

Baseado na pesquisa de mercado:
- Cupcakes estão em alta no Brasil (moda consolidada)
- Público-alvo: todas classes, idades e gêneros
- Diferencial: visual atrativo, mais de 40 sabores, qualidade gourmet
- Nicho: delivery e vendas online (tendência pós-pandemia)

### Escopo do Sistema

**Foco:** Vitrine virtual, pedido eletrônico, pagamento e entrega

**Funcionalidades principais:**
1. Catálogo online com filtros e busca
2. Carrinho de compras inteligente
3. Checkout simplificado
4. Pagamento (PIX, Cartão, Dinheiro)
5. Rastreamento de entrega
6. Gestão administrativa

---

## 📊 Visão Geral do Projeto

### Indicadores Chave

| Métrica | Valor |
|---------|-------|
| **Total de User Stories** | 35 |
| **Total de Story Points** | 197 |
| **Épicos** | 6 |
| **Sprints planejados** | 8 (2 semanas cada) |
| **Duração estimada** | 4-5 meses |
| **Histórias MVP** | 17 (106 pontos) |
| **Horas estimadas (MVP)** | ~516h |

### Distribuição por Prioridade

- 🔴 **Alta (Must Have):** 20 histórias (57%)
- 🟡 **Média (Should Have):** 12 histórias (34%)
- 🟢 **Baixa (Could Have):** 3 histórias (9%)

---

## 🎯 Épicos do Projeto

### EP01 - Vitrine Virtual (24 pts)
Navegação e descoberta de produtos

**Histórias:** US01, US02, US03, US04, US05, US06
**Objetivo:** Cliente encontra e conhece os cupcakes facilmente

### EP02 - Gestão de Pedidos (43 pts)
Carrinho e checkout

**Histórias:** US07-US15
**Objetivo:** Cliente cria e acompanha pedidos

### EP03 - Pagamento (44 pts)
Múltiplos métodos de pagamento

**Histórias:** US16-US20
**Objetivo:** Processar pagamentos com segurança

### EP04 - Entrega (29 pts)
Logística e rastreamento

**Histórias:** US21-US25
**Objetivo:** Gerenciar entregas eficientemente

### EP05 - Conta do Cliente (28 pts)
Autenticação e personalização

**Histórias:** US26-US31
**Objetivo:** Cliente gerencia perfil e preferências

### EP06 - Gestão Admin (29 pts)
Operações administrativas

**Histórias:** US32-US35
**Objetivo:** Admin opera a loja

---

## 📝 Cartões de História (Resumo)

### 🏆 Top 10 Histórias Prioritárias

#### 1. US26 - Criar Conta (5 pts)
> **Como** visitante,
> **Quero** criar uma conta,
> **Para** fazer pedidos e acompanhar compras.

**Critérios:** Cadastro com validação de e-mail, senha criptografada, confirmação por e-mail

---

#### 2. US27 - Login (5 pts)
> **Como** cliente,
> **Quero** fazer login,
> **Para** acessar meus pedidos e dados.

**Critérios:** Autenticação JWT, sessão persistente, erro claro em credenciais inválidas

---

#### 3. US01 - Catálogo (5 pts)
> **Como** cliente,
> **Quero** visualizar todos os cupcakes,
> **Para** conhecer produtos e decidir compra.

**Critérios:** Grid responsivo, fotos/preços/avaliações, indicação de esgotado, < 3s

---

#### 4. US07 - Adicionar ao Carrinho (5 pts)
> **Como** cliente,
> **Quero** adicionar cupcakes ao carrinho,
> **Para** acumular produtos antes de finalizar.

**Critérios:** Feedback visual, contador atualizado, validação de estoque

---

#### 5. US12 - Checkout (8 pts)
> **Como** cliente autenticado,
> **Quero** finalizar meu pedido,
> **Para** receber os cupcakes no meu endereço.

**Critérios:** Validação CEP, cálculo frete, resumo completo, confirmação por e-mail

---

#### 6. US17 - PIX (13 pts)
> **Como** cliente,
> **Quero** pagar via PIX,
> **Para** ter confirmação imediata.

**Critérios:** QR Code gerado, webhook de confirmação, atualização automática de status

---

#### 7. US21 - Frete (8 pts)
> **Como** cliente,
> **Quero** ver o valor do frete,
> **Para** saber o custo total.

**Critérios:** API ViaCEP, cálculo automático, prazo estimado, erro se fora da área

---

#### 8. US23 - Status Entrega (8 pts)
> **Como** cliente,
> **Quero** acompanhar status em tempo real,
> **Para** saber quando chegará.

**Critérios:** 6 status com cores, data/hora, notificação por e-mail em cada mudança

---

#### 9. US32 - Ger. Produtos Admin (8 pts)
> **Como** admin,
> **Quero** gerenciar produtos,
> **Para** manter catálogo atualizado.

**Critérios:** CRUD completo, upload de imagem, soft delete, validações

---

#### 10. US33 - Ger. Pedidos Admin (8 pts)
> **Como** admin,
> **Quero** gerenciar pedidos,
> **Para** processar entregas.

**Critérios:** Listar todos, filtros, atualizar status, notificar cliente

---

## 🗺️ Mapa de Afinidade

### Agrupamento por Jornada do Cliente

```
JORNADA DO CLIENTE

1. DESCOBERTA                2. AVALIAÇÃO               3. COMPRA
   ├─ US01: Catálogo            ├─ US04: Detalhes          ├─ US07: Add Carrinho
   ├─ US02: Filtrar             ├─ US06: Avaliações        ├─ US08: Ver Carrinho
   ├─ US03: Buscar              └─ US30: Favoritar         ├─ US09: Alterar Qtd
   └─ US05: Destaques                                      ├─ US10: Remover
                                                           └─ US11: Observações

4. PAGAMENTO                 5. ENTREGA                 6. PÓS-VENDA
   ├─ US12: Checkout            ├─ US21: Frete             ├─ US13: Meus Pedidos
   ├─ US16: Escolher            ├─ US22: Horário           ├─ US14: Detalhes
   ├─ US17: PIX                 ├─ US23: Status            ├─ US24: Confirmar
   ├─ US18: Cartão              └─ US25: Reagendar         ├─ US31: Avaliar
   ├─ US19: Dinheiro                                       └─ US15: Cancelar
   └─ US20: Comprovante

FUNDAÇÃO (pré-requisitos)
   ├─ US26: Criar Conta
   ├─ US27: Login
   ├─ US28: Recuperar Senha
   └─ US29: Editar Perfil

ADMINISTRATIVO (paralelo)
   ├─ US32: Ger. Produtos
   ├─ US33: Ger. Pedidos
   ├─ US34: Relatórios
   └─ US35: Estoque
```

### Análise de Dependências

**Sequência crítica (caminho feliz):**
```
US26 (Criar Conta)
  ↓
US27 (Login)
  ↓
US01 (Catálogo) → US04 (Detalhes) → US07 (Add Carrinho)
  ↓
US08 (Ver Carrinho) → US12 (Checkout)
  ↓
US21 (Frete) → US16 (Pagamento) → US17 (PIX)
  ↓
US23 (Status) → US24 (Confirmar) → US31 (Avaliar)
```

---

## 📅 Product Backlog Priorizado

### Release 1.0 - MVP (Sprints 1-6)

#### Sprint 1: Fundação (23 pts)
- US26: Criar Conta (5)
- US27: Login (5)
- US01: Catálogo (5)
- US04: Detalhes (5)
- US09: Alterar Qtd (3)

**Entregável:** Sistema com autenticação e catálogo navegável

---

#### Sprint 2: Carrinho (22 pts)
- US07: Adicionar (5)
- US08: Visualizar (5)
- US10: Remover (2)
- US02: Filtrar (3)
- US03: Buscar (3)
- US11: Observações (2)
- US Remover (2)

**Entregável:** Carrinho funcional completo

---

#### Sprint 3: Checkout (21 pts)
- US12: Finalizar Pedido (8)
- US21: Calcular Frete (8)
- US13: Meus Pedidos (5)

**Entregável:** Fluxo até pagamento

---

#### Sprint 4: Pagamento (26 pts)
- US16: Escolher (8)
- US17: PIX (13)
- US19: Dinheiro (5)

**Entregável:** Pagamento funcional

---

#### Sprint 5: Entrega (19 pts)
- US23: Status (8)
- US14: Detalhes Pedido (5)
- US22: Horário (5)
- US15: Cancelar (3)

**Entregável:** Rastreamento completo

---

#### Sprint 6: Admin (21 pts)
- US32: Ger. Produtos (8)
- US33: Ger. Pedidos (8)
- US35: Estoque (5)

**Entregável:** Painel administrativo operacional

---

### 🚀 CHECKPOINT MVP - Semana 14

**Validação de lançamento:**
- [ ] Cliente pode se cadastrar, logar e navegar
- [ ] Cliente pode comprar via PIX
- [ ] Cliente pode acompanhar pedido
- [ ] Admin pode gerenciar loja
- [ ] Sistema deployado e estável

---

## 📋 Requisitos Funcionais

### RF001 - Autenticação
Sistema deve permitir cadastro, login e recuperação de senha com JWT e bcrypt

### RF002 - Catálogo
Sistema deve exibir produtos com filtros por categoria e busca por nome

### RF003 - Carrinho
Sistema deve gerenciar carrinho (adicionar, remover, alterar quantidade)

### RF004 - Checkout
Sistema deve finalizar pedidos com validação de CEP (ViaCEP) e cálculo de frete

### RF005 - Pagamento
Sistema deve processar PIX (QR Code + webhook), cartão (gateway) e dinheiro

### RF006 - Pedidos Cliente
Cliente deve visualizar histórico, detalhes e cancelar pedidos pendentes

### RF007 - Entrega
Sistema deve gerenciar status com 6 etapas e notificações automáticas

### RF008 - Perfil
Cliente deve editar dados, favoritar produtos e avaliar (1-5 estrelas)

### RF009 - Avaliações
Sistema deve exibir média de notas e listar comentários por produto

### RF010 - Admin Produtos
Admin deve criar, editar, desativar produtos e gerenciar estoque

### RF011 - Admin Pedidos
Admin deve listar, filtrar e atualizar status de todos pedidos

### RF012 - Relatórios
Admin deve visualizar vendas, produtos top, receita e exportar relatórios

### RF013 - Comprovantes
Sistema deve gerar PDF de comprovantes e enviar por e-mail

---

## ⚙️ Requisitos Não Funcionais

### RNF001 - Performance
- Página inicial < 3s
- Busca < 500ms
- Checkout < 2s
- 100 usuários simultâneos

### RNF002 - Segurança
- Bcrypt (salt ≥ 10)
- JWT (exp 24h)
- HTTPS obrigatório
- RLS no banco
- PCI compliance (sem armazenar dados de cartão)

### RNF003 - Usabilidade
- Português BR
- Mobile-first
- Feedback < 300ms
- WCAG 2.1 AA

### RNF004 - Disponibilidade
- Uptime 99%
- Backup diário
- RPO < 24h, RTO < 4h

### RNF005 - Compatibilidade
- Chrome, Firefox, Safari, Edge (2 últimas versões)
- 320px-1920px
- iOS 14+, Android 10+

### RNF006 - Manutenibilidade
- MVC
- Componentes reutilizáveis
- Documentação OpenAPI
- Cobertura ≥ 70%

---

## 🔧 Tarefas Técnicas (Exemplo: US26 - Criar Conta)

### Backend (10h)
- T001: Endpoint POST /api/auth/register (2h)
- T002: Validar e-mail único (1h)
- T003: Criptografar senha bcrypt (1h)
- T004: Integrar Supabase Auth (3h)
- T005: Enviar e-mail confirmação (2h)
- T006: Criar registro `usuarios` (1h)

### Frontend (7.5h)
- T007: Componente `CadastroForm` (2h)
- T008: Validar formulário (2h)
- T009: Integrar endpoint (1h)
- T010: Mensagens sucesso/erro (1h)
- T011: Redirecionar após cadastro (0.5h)
- T012: Testar cadastro válido (1h)

### QA (3.5h)
- T013: Testar validações (1h)
- T014: Testar e-mail duplicado (0.5h)
- T015: Testar recebimento e-mail (1h)

**Total: 20h**

---

## 📊 Estimativas Consolidadas

### Por Épico

| Épico | Story Points | Horas | Sprints |
|-------|--------------|-------|---------|
| EP01 - Vitrine | 24 | 96h | 1-2 |
| EP02 - Pedidos | 43 | 172h | 2-5 |
| EP03 - Pagamento | 44 | 140h | 4 |
| EP04 - Entrega | 29 | 116h | 5 |
| EP05 - Cliente | 28 | 112h | 1, 7 |
| EP06 - Admin | 29 | 116h | 6 |
| **TOTAL** | **197** | **752h** | **8** |

### MVP (Sprints 1-6)

- **Story Points:** 106 (54% do total)
- **Horas:** ~516h
- **Histórias:** 17 (49% do total)
- **Duração:** 12-14 semanas

### Por Disciplina

- **Backend:** 300h (40%)
- **Frontend:** 360h (48%)
- **QA:** 92h (12%)

---

## 🎨 Stack Tecnológica

### Frontend
- **Framework:** React 18 + TypeScript
- **Estado:** Zustand
- **Estilo:** Tailwind CSS
- **Ícones:** Lucide React
- **Build:** Vite
- **Deploy:** Netlify

### Backend
- **Database:** PostgreSQL (Supabase)
- **Auth:** Supabase Auth
- **API:** RESTful
- **Validação:** Zod
- **E-mail:** Resend

### Integrações
- **Pagamento:** MercadoPago / PagSeguro (PIX)
- **CEP:** ViaCEP
- **Storage:** Supabase Storage

---

## ✅ Definition of Done

Uma história é DONE quando:

1. ✅ Código implementado e revisado
2. ✅ Testes unitários passando
3. ✅ Critérios de aceitação validados
4. ✅ Documentação atualizada
5. ✅ Deploy em staging
6. ✅ Aprovação do PO

---

## 📈 Métricas de Sucesso

### MVP (Release 1.0)
- Taxa de conversão > 3%
- Checkout < 3 minutos
- Abandono carrinho < 70%
- 90% pedidos processados com sucesso

### Release 1.1
- 20% clientes usam favoritos
- 5% taxa de avaliação
- 10% clientes recorrentes

### Release 1.2
- NPS > 50
- Ticket médio +15%
- Admin economiza 30% tempo

---

## ⚠️ Riscos e Mitigações

### 🔴 Riscos Críticos

#### R001: Integração PIX complexa
- **Impacto:** Alto (bloqueia MVP)
- **Probabilidade:** Média
- **Mitigação:** Começar integração no Sprint 3, usar sandbox, ter plano B (apenas dinheiro)

#### R002: Checkout com muitas validações
- **Impacto:** Médio (afeta UX)
- **Probabilidade:** Alta
- **Mitigação:** Pair programming, revisão de código obrigatória

### 🟡 Riscos Médios

#### R003: Sistema de notificações atravessa épicos
- **Impacto:** Médio
- **Probabilidade:** Média
- **Mitigação:** Criar serviço de e-mail centralizado no Sprint 1

#### R004: Upload de imagens (admin)
- **Impacto:** Baixo
- **Probabilidade:** Baixa
- **Mitigação:** Usar Supabase Storage (já integrado)

---

## 🤝 Equipe e Papéis

### Core Team
- **Product Owner:** Define prioridades e valida entregas
- **Scrum Master:** Facilita cerimônias e remove impedimentos
- **Tech Lead:** Arquitetura e decisões técnicas
- **Desenvolvedores:** 1 Backend + 1 Frontend
- **QA:** Testes e validação de qualidade

### Stakeholders
- **Cliente (Dono da Loja):** Valida funcionalidades e UX
- **Usuários Beta:** 5 testadores para validação (Fase 3)

---

## 📅 Cerimônias Scrum

### Sprint Planning
- **Quando:** Primeiro dia do sprint
- **Duração:** 4h
- **Objetivo:** Selecionar histórias e planejar tarefas

### Daily Standup
- **Quando:** Diariamente, 9h
- **Duração:** 15min
- **Objetivo:** Sincronizar time, identificar bloqueios

### Sprint Review
- **Quando:** Último dia do sprint
- **Duração:** 2h
- **Objetivo:** Demonstrar incremento ao PO/cliente

### Sprint Retrospective
- **Quando:** Após review
- **Duração:** 1.5h
- **Objetivo:** Melhorar processo

### Refinamento (Grooming)
- **Quando:** Quinta-feira, semanal
- **Duração:** 2h
- **Objetivo:** Preparar histórias dos próximos sprints

---

## 📚 Referências

### Documentação Detalhada
- [01-user-stories.md](./01-user-stories.md) - 35 histórias completas
- [02-mapa-afinidade.md](./02-mapa-afinidade.md) - Agrupamento e análise
- [03-product-backlog.md](./03-product-backlog.md) - Backlog priorizado
- [04-requirements-tasks.md](./04-requirements-tasks.md) - Requisitos e tarefas

### Pesquisa de Mercado
- Artigo: "Stands ou Loja de Cupcakes" (NovoNegocio.com.br)
- Tendências: Cupcakes em alta, delivery crescente, visual essencial

---

## ✅ Aprovações

| Papel | Nome | Assinatura | Data |
|-------|------|------------|------|
| Product Owner | [Nome] | ____________ | __/__/__ |
| Cliente | [Nome] | ____________ | __/__/__ |
| Tech Lead | [Nome] | ____________ | __/__/__ |
| Scrum Master | [Nome] | ____________ | __/__/__ |

---

**Documento:** Especificação Ágil Completa - Ed Cupcakes
**Versão:** 1.0
**Data de Criação:** 22/10/2025
**Última Atualização:** 22/10/2025
**Status:** ✅ Aprovado para Desenvolvimento
**Próxima Revisão:** Após Sprint 2

---

## 🎯 Próximos Passos

1. **Aprovação formal** deste documento pelo cliente e stakeholders
2. **Setup de ambiente** (Sprint 0 - 1 semana)
   - Configurar repositório GitHub
   - Provisionar Supabase
   - Setup CI/CD
   - Configurar ferramentas (Jira, Slack, etc.)
3. **Kick-off Sprint 1** (Semana 2)
4. **Reunião semanal com cliente** para validação contínua
5. **Demo ao cliente** ao final de cada sprint

---

**FIM DA ESPECIFICAÇÃO ÁGIL**
