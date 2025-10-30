# Caramel Coffee and Cupcakes - Documentação Ágil
## Situação-Problema 1: Análise e Levantamento de Requisitos

---

## 📚 Índice de Documentos

### 🎯 [00 - Especificação Ágil Completa](./00-especificacao-agil-completa.md)
**Documento consolidado com visão geral do projeto**

Contém:
- Sumário executivo
- Contexto do negócio
- Visão geral (35 histórias, 197 pontos)
- Épicos do projeto (6 épicos)
- Top 10 histórias prioritárias
- Mapa de afinidade resumido
- Backlog priorizado por sprint
- Requisitos funcionais e não funcionais
- Estimativas consolidadas
- Stack tecnológica
- Riscos e mitigações
- Métricas de sucesso
- Próximos passos

**Tamanho:** 16KB
**Público:** Stakeholders, Cliente, Equipe Completa

---

### 📋 [01 - User Stories](./01-user-stories.md)
**35 Cartões de História de Usuário completos**

Contém:
- Formato padrão (Como/Quero/Para)
- Critérios de aceitação detalhados
- Prioridade (MoSCoW)
- Estimativa (Story Points)
- Épico associado
- 6 épicos organizados

**Estrutura:**
- EP01: Vitrine Virtual (6 histórias, 24 pts)
- EP02: Gestão de Pedidos (9 histórias, 43 pts)
- EP03: Pagamento (5 histórias, 44 pts)
- EP04: Entrega (5 histórias, 29 pts)
- EP05: Conta do Cliente (6 histórias, 28 pts)
- EP06: Gestão Admin (4 histórias, 29 pts)

**Tamanho:** 22KB
**Público:** Product Owner, Desenvolvedores, QA

---

### 🗺️ [02 - Mapa de Afinidade](./02-mapa-afinidade.md)
**Agrupamento e análise de histórias relacionadas**

Contém:
- Mapa visual de afinidade
- Agrupamento por temas e sub-temas
- Análise de dependências (diagrama de fluxo)
- Matriz de priorização (Valor x Esforço)
- Análise por persona (Cliente e Admin)
- Grupos para sprints sugeridos
- Insights e descobertas importantes

**Destaques:**
- 60% das histórias são prioridade Alta
- Carrinho é hub central (8 dependências)
- 7 Quick Wins identificados
- MVP viável em 6 sprints

**Tamanho:** 19KB
**Público:** Product Owner, Scrum Master, Tech Lead

---

### 📅 [03 - Product Backlog Priorizado](./03-product-backlog.md)
**Backlog completo ordenado por valor de negócio**

Contém:
- Critérios de priorização (MoSCoW + fatores)
- 35 histórias rankeadas (1-35)
- Roadmap de releases (1.0, 1.1, 1.2)
- Backlog detalhado por sprint (1-8)
- Definition of Ready (DoR)
- Definition of Done (DoD)
- Métricas de sucesso por release
- Critérios de repriorização

**Releases planejadas:**
- **Release 1.0 (MVP):** 17 histórias, 106 pts, 6 sprints
- **Release 1.1:** 8 histórias, 31 pts, 2 sprints
- **Release 1.2:** 10 histórias, 60 pts, 2 sprints

**Tamanho:** 17KB
**Público:** Product Owner, Scrum Master, Stakeholders

---

### ⚙️ [04 - Requisitos e Tarefas](./04-requirements-tasks.md)
**Decomposição técnica de histórias em requisitos e tarefas**

Contém:
- 13 Requisitos Funcionais (RF001-RF013)
- 6 Requisitos Não Funcionais (RNF001-RNF006)
- Tarefas detalhadas por história (Backend, Frontend, QA)
- Estimativa de horas por tarefa
- Resumo de estimativas por épico
- Premissas e riscos de prazo

**Exemplo detalhado:**
- US26 (Criar Conta): 20 horas
  - Backend: 10h (6 tarefas)
  - Frontend: 7.5h (6 tarefas)
  - QA: 3.5h (4 tarefas)

**Estimativas totais:**
- **197 Story Points** = **~752 horas**
- Backend: 300h (40%)
- Frontend: 360h (48%)
- QA: 92h (12%)

**Tamanho:** 16KB
**Público:** Desenvolvedores, Tech Lead, QA

---

## 🎯 Como Usar Esta Documentação

### Para o Product Owner
1. **Comece por:** [00-especificacao-agil-completa.md](./00-especificacao-agil-completa.md)
2. **Priorize com:** [03-product-backlog.md](./03-product-backlog.md)
3. **Valide histórias em:** [01-user-stories.md](./01-user-stories.md)

### Para o Scrum Master
1. **Visão geral:** [00-especificacao-agil-completa.md](./00-especificacao-agil-completa.md)
2. **Planeje sprints com:** [02-mapa-afinidade.md](./02-mapa-afinidade.md)
3. **Organize backlog em:** [03-product-backlog.md](./03-product-backlog.md)

### Para Desenvolvedores
1. **Entenda histórias em:** [01-user-stories.md](./01-user-stories.md)
2. **Veja tarefas técnicas em:** [04-requirements-tasks.md](./04-requirements-tasks.md)
3. **Consulte requisitos em:** [04-requirements-tasks.md](./04-requirements-tasks.md)

### Para QA
1. **Critérios de aceitação em:** [01-user-stories.md](./01-user-stories.md)
2. **Casos de teste em:** [04-requirements-tasks.md](./04-requirements-tasks.md)
3. **Definition of Done em:** [03-product-backlog.md](./03-product-backlog.md)

### Para Stakeholders/Cliente
1. **Leia:** [00-especificacao-agil-completa.md](./00-especificacao-agil-completa.md)
2. **Revise prioridades em:** [03-product-backlog.md](./03-product-backlog.md)
3. **Aprove e assine** o documento principal

---

## 📊 Resumo Executivo

### Números do Projeto

| Métrica | Valor |
|---------|-------|
| **Total de User Stories** | 35 |
| **Total de Story Points** | 197 |
| **Total de Horas Estimadas** | 752h |
| **Épicos** | 6 |
| **Sprints Planejados** | 8 |
| **Duração Total** | 16-20 semanas |
| **MVP (Release 1.0)** | 17 histórias, 106 pts, 516h |

### Distribuição de Prioridades

- 🔴 **Alta (Must Have):** 20 histórias (57%)
- 🟡 **Média (Should Have):** 12 histórias (34%)
- 🟢 **Baixa (Could Have):** 3 histórias (9%)

### Épicos

1. **EP01 - Vitrine Virtual:** 24 pontos
2. **EP02 - Gestão de Pedidos:** 43 pontos ⚠️ (maior)
3. **EP03 - Pagamento:** 44 pontos ⚠️ (maior)
4. **EP04 - Entrega:** 29 pontos
5. **EP05 - Conta do Cliente:** 28 pontos
6. **EP06 - Gestão Admin:** 29 pontos

---

## ✅ Checklist de Validação

### Documentação Completa
- [x] User Stories criadas (35)
- [x] Critérios de aceitação definidos
- [x] Estimativas realizadas (Planning Poker)
- [x] Priorização aplicada (MoSCoW)
- [x] Mapa de afinidade criado
- [x] Dependências identificadas
- [x] Backlog priorizado
- [x] Sprints planejados (1-8)
- [x] Requisitos funcionais extraídos (13)
- [x] Requisitos não funcionais definidos (6)
- [x] Tarefas técnicas detalhadas
- [x] Estimativas de horas calculadas

### Validação de Qualidade
- [x] Todas histórias seguem formato padrão
- [x] Critérios de aceitação são testáveis
- [x] Estimativas validadas por equipe
- [x] Priorização alinhada com valor de negócio
- [x] Dependências mapeadas
- [x] Riscos identificados
- [x] Métricas de sucesso definidas

### Próximos Passos
- [ ] Revisão com cliente
- [ ] Aprovação formal do documento
- [ ] Setup de ambiente (Sprint 0)
- [ ] Kick-off Sprint 1
- [ ] Cerimônias Scrum agendadas

---

## 🤝 Equipe Responsável

**Analista Responsável:** [Nome]
**Product Owner:** [Nome]
**Scrum Master:** [Nome]
**Tech Lead:** [Nome]

**Data de Criação:** 22/10/2025
**Última Atualização:** 22/10/2025
**Versão:** 1.0
**Status:** ✅ **Aprovado para apresentação ao cliente**

---

## 📝 Histórico de Versões

| Versão | Data | Autor | Descrição |
|--------|------|-------|-----------|
| 1.0 | 22/10/2025 | Analista | Criação inicial da documentação completa |

---

## 📞 Contato

Para dúvidas ou esclarecimentos sobre esta documentação:
- **E-mail:** [email@exemplo.com]
- **Slack:** #projeto-ed-cupcakes
- **Jira:** [Link do projeto]

---

## 🎓 Contexto Acadêmico

**Disciplina:** Projeto Integrador Transdisciplinar em Engenharia de Software
**Situação-Problema:** 1 - Análise e Levantamento de Requisitos
**Objetivo:** Elicitar requisitos, criar histórias de usuário e especificação ágil completa
**Entrega:** Documentação aprovada pelo cliente e equipe

---

**FIM DO README - DOCUMENTAÇÃO ÁGIL**

**Próximo passo:** Apresentar ao cliente e obter aprovação formal antes de iniciar Sprint 0
