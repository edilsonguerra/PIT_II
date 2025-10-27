# Ed Cupcakes - Requisitos e Tarefas

## 1. Introdução

Este documento extrai os **requisitos técnicos** de cada User Story e os decompõe em **tarefas executáveis** para a equipe de desenvolvimento.

**Estrutura:**
- Requisito Funcional (RF)
- Requisito Não Funcional (RNF)
- Tarefas técnicas por história
- Estimativa de horas por tarefa

---

## 2. Requisitos Funcionais Extraídos

### RF001 - Autenticação de Usuários
**Origem:** US26, US27, US28
**Descrição:** Sistema deve permitir cadastro, login e recuperação de senha

**Detalhamento:**
- RF001.1: Cadastro com nome, e-mail, senha e telefone
- RF001.2: Validação de e-mail único
- RF001.3: Criptografia de senha com bcrypt
- RF001.4: Geração de token JWT para sessão
- RF001.5: Envio de e-mail de confirmação
- RF001.6: Link de recuperação de senha válido por 1h

---

### RF002 - Catálogo de Produtos
**Origem:** US01, US02, US03, US04, US05
**Descrição:** Sistema deve exibir produtos com filtros e busca

**Detalhamento:**
- RF002.1: Listar todos cupcakes ativos
- RF002.2: Filtrar por categoria
- RF002.3: Buscar por nome ou descrição
- RF002.4: Exibir detalhes completos do produto
- RF002.5: Destacar produtos em promoção/novidades
- RF002.6: Exibir média de avaliações

---

### RF003 - Carrinho de Compras
**Origem:** US07, US08, US09, US10, US11
**Descrição:** Sistema deve gerenciar carrinho de compras do cliente

**Detalhamento:**
- RF003.1: Adicionar produto ao carrinho
- RF003.2: Visualizar itens do carrinho
- RF003.3: Alterar quantidade de item
- RF003.4: Remover item do carrinho
- RF003.5: Adicionar observações por item
- RF003.6: Calcular subtotal e total automaticamente
- RF003.7: Persistir carrinho entre sessões

---

### RF004 - Processo de Checkout
**Origem:** US12, US21
**Descrição:** Sistema deve finalizar pedidos com dados de entrega

**Detalhamento:**
- RF004.1: Validar dados de entrega (endereço, CEP)
- RF004.2: Integrar com API ViaCEP para validação
- RF004.3: Calcular frete baseado em CEP
- RF004.4: Exibir resumo completo do pedido
- RF004.5: Criar registro de pedido no banco
- RF004.6: Esvaziar carrinho após confirmação
- RF004.7: Enviar e-mail de confirmação

---

### RF005 - Sistema de Pagamento
**Origem:** US16, US17, US18, US19
**Descrição:** Sistema deve processar pagamentos via múltiplos métodos

**Detalhamento:**
- RF005.1: Selecionar forma de pagamento
- RF005.2: Gerar QR Code PIX
- RF005.3: Detectar confirmação de pagamento PIX (webhook)
- RF005.4: Processar pagamento com cartão (gateway)
- RF005.5: Registrar pagamento em dinheiro
- RF005.6: Atualizar status do pedido após pagamento

---

### RF006 - Gestão de Pedidos (Cliente)
**Origem:** US13, US14, US15
**Descrição:** Cliente deve visualizar e gerenciar seus pedidos

**Detalhamento:**
- RF006.1: Listar todos pedidos do usuário
- RF006.2: Exibir detalhes completos de um pedido
- RF006.3: Cancelar pedido pendente
- RF006.4: Filtrar pedidos por status

---

### RF007 - Rastreamento de Entrega
**Origem:** US22, US23, US24, US25
**Descrição:** Sistema deve gerenciar logística de entrega

**Detalhamento:**
- RF007.1: Escolher horário de entrega
- RF007.2: Exibir status do pedido em tempo real
- RF007.3: Notificar cliente por e-mail em cada mudança de status
- RF007.4: Permitir confirmação de recebimento
- RF007.5: Permitir reagendamento (com restrições)

---

### RF008 - Perfil do Cliente
**Origem:** US29, US30, US31
**Descrição:** Cliente deve gerenciar perfil e interagir com produtos

**Detalhamento:**
- RF008.1: Editar dados pessoais (nome, telefone, endereço)
- RF008.2: Adicionar produtos aos favoritos
- RF008.3: Listar produtos favoritos
- RF008.4: Avaliar produtos comprados (nota + comentário)
- RF008.5: Editar/deletar própria avaliação

---

### RF009 - Visualização de Avaliações
**Origem:** US06
**Descrição:** Exibir avaliações de clientes sobre produtos

**Detalhamento:**
- RF009.1: Exibir nota média (1-5 estrelas)
- RF009.2: Listar todos comentários
- RF009.3: Exibir nome do avaliador e data
- RF009.4: Ordenar por mais recentes

---

### RF010 - Gestão de Produtos (Admin)
**Origem:** US32, US35
**Descrição:** Admin deve gerenciar catálogo de produtos

**Detalhamento:**
- RF010.1: Criar novo produto (CRUD)
- RF010.2: Editar produto existente
- RF010.3: Desativar/ativar produto (soft delete)
- RF010.4: Upload de imagem do produto
- RF010.5: Gerenciar estoque (quantidade disponível)
- RF010.6: Alertar estoque baixo (< 5 unidades)

---

### RF011 - Gestão de Pedidos (Admin)
**Origem:** US33
**Descrição:** Admin deve gerenciar pedidos de clientes

**Detalhamento:**
- RF011.1: Listar todos pedidos do sistema
- RF011.2: Filtrar por status, data, cliente
- RF011.3: Atualizar status do pedido
- RF011.4: Visualizar detalhes completos
- RF011.5: Cancelar pedido (se necessário)
- RF011.6: Notificar cliente automaticamente

---

### RF012 - Relatórios e Análises (Admin)
**Origem:** US34
**Descrição:** Admin deve visualizar métricas de vendas

**Detalhamento:**
- RF012.1: Receita total por período
- RF012.2: Produtos mais vendidos
- RF012.3: Avaliação média dos produtos
- RF012.4: Gráficos visuais
- RF012.5: Exportar relatório (PDF/Excel)

---

### RF013 - Comprovantes
**Origem:** US20
**Descrição:** Sistema deve gerar comprovantes de pagamento

**Detalhamento:**
- RF013.1: Gerar PDF do comprovante
- RF013.2: Enviar por e-mail
- RF013.3: Permitir download na área do cliente

---

## 3. Requisitos Não Funcionais

### RNF001 - Performance
- RNF001.1: Página inicial deve carregar em < 3 segundos
- RNF001.2: Busca deve retornar resultados em < 500ms
- RNF001.3: Checkout deve processar em < 2 segundos
- RNF001.4: Sistema deve suportar 100 usuários simultâneos

---

### RNF002 - Segurança
- RNF002.1: Senhas criptografadas com bcrypt (salt rounds ≥ 10)
- RNF002.2: Tokens JWT com expiração de 24h
- RNF002.3: HTTPS obrigatório em produção
- RNF002.4: Row Level Security (RLS) no banco de dados
- RNF002.5: Validação de entrada em todos formulários
- RNF002.6: Proteção contra SQL Injection
- RNF002.7: Dados de cartão não armazenados localmente (PCI compliance)

---

### RNF003 - Usabilidade
- RNF003.1: Interface em português do Brasil
- RNF003.2: Design responsivo (mobile-first)
- RNF003.3: Feedback visual para todas ações (< 300ms)
- RNF003.4: Mensagens de erro claras e acionáveis
- RNF003.5: Acessibilidade WCAG 2.1 AA

---

### RNF004 - Disponibilidade
- RNF004.1: Uptime de 99% (exceto manutenções programadas)
- RNF004.2: Backup diário automatizado
- RNF004.3: Recuperação de desastres (RPO < 24h, RTO < 4h)

---

### RNF005 - Compatibilidade
- RNF005.1: Chrome, Firefox, Safari, Edge (últimas 2 versões)
- RNF005.2: Resoluções de 320px a 1920px
- RNF005.3: iOS 14+ e Android 10+

---

### RNF006 - Manutenibilidade
- RNF006.1: Código seguindo padrão MVC
- RNF006.2: Componentes React reutilizáveis
- RNF006.3: Documentação de APIs (Swagger/OpenAPI)
- RNF006.4: Cobertura de testes ≥ 70%

---

## 4. Tarefas Detalhadas por User Story

### 📋 US26 - Criar Conta de Cliente (5 pts / 20h)

#### Backend Tasks
| # | Tarefa | Estimativa | Responsável |
|---|--------|------------|-------------|
| T001 | Criar endpoint POST /api/auth/register | 2h | Backend |
| T002 | Validar e-mail único no banco | 1h | Backend |
| T003 | Criptografar senha com bcrypt | 1h | Backend |
| T004 | Integrar Supabase Auth para criar usuário | 3h | Backend |
| T005 | Enviar e-mail de confirmação (Resend/SMTP) | 2h | Backend |
| T006 | Criar registro na tabela `usuarios` | 1h | Backend |

#### Frontend Tasks
| # | Tarefa | Estimativa | Responsável |
|---|--------|------------|-------------|
| T007 | Criar componente `CadastroForm` | 2h | Frontend |
| T008 | Validar formulário (Zod/Yup) | 2h | Frontend |
| T009 | Integrar com endpoint de registro | 1h | Frontend |
| T010 | Exibir mensagens de sucesso/erro | 1h | Frontend |
| T011 | Redirecionar para login após cadastro | 0.5h | Frontend |

#### QA Tasks
| # | Tarefa | Estimativa | Responsável |
|---|--------|------------|-------------|
| T012 | Testar cadastro com dados válidos | 1h | QA |
| T013 | Testar validações de campo | 1h | QA |
| T014 | Testar e-mail duplicado | 0.5h | QA |
| T015 | Testar recebimento de e-mail | 1h | QA |

**Total: 20 horas**

---

### 📋 US27 - Fazer Login (5 pts / 18h)

#### Backend Tasks
| # | Tarefa | Estimativa | Responsável |
|---|--------|------------|-------------|
| T016 | Criar endpoint POST /api/auth/login | 2h | Backend |
| T017 | Validar credenciais (e-mail + senha) | 2h | Backend |
| T018 | Gerar token JWT | 2h | Backend |
| T019 | Criar middleware de autenticação | 3h | Backend |

#### Frontend Tasks
| # | Tarefa | Estimativa | Responsável |
|---|--------|------------|-------------|
| T020 | Criar componente `LoginForm` | 2h | Frontend |
| T021 | Integrar com endpoint de login | 1h | Frontend |
| T022 | Armazenar token (localStorage/cookie) | 1h | Frontend |
| T023 | Implementar contexto de autenticação | 2h | Frontend |
| T024 | Redirecionar após login bem-sucedido | 1h | Frontend |

#### QA Tasks
| # | Tarefa | Estimativa | Responsável |
|---|--------|------------|-------------|
| T025 | Testar login com credenciais válidas | 0.5h | QA |
| T026 | Testar login com credenciais inválidas | 0.5h | QA |
| T027 | Testar persistência de sessão | 1h | QA |

**Total: 18 horas**

---

### 📋 US01 - Visualizar Catálogo (5 pts / 20h)

#### Backend Tasks
| # | Tarefa | Estimativa | Responsável |
|---|--------|------------|-------------|
| T028 | Criar endpoint GET /api/produtos | 2h | Backend |
| T029 | Filtrar apenas produtos ativos | 1h | Backend |
| T030 | Implementar paginação (opcional) | 2h | Backend |
| T031 | Retornar dados otimizados (sem campos desnecessários) | 1h | Backend |

#### Frontend Tasks
| # | Tarefa | Estimativa | Responsável |
|---|--------|------------|-------------|
| T032 | Criar componente `ProdutoCard` | 3h | Frontend |
| T033 | Criar componente `ProdutoGrid` | 2h | Frontend |
| T034 | Integrar com endpoint de produtos | 2h | Frontend |
| T035 | Implementar skeleton loading | 2h | Frontend |
| T036 | Otimizar imagens (lazy loading) | 2h | Frontend |

#### QA Tasks
| # | Tarefa | Estimativa | Responsável |
|---|--------|------------|-------------|
| T037 | Testar carregamento do catálogo | 1h | QA |
| T038 | Testar responsividade (mobile/desktop) | 1h | QA |
| T039 | Testar performance (< 3s) | 1h | QA |

**Total: 20 horas**

---

### 📋 US07 - Adicionar ao Carrinho (5 pts / 22h)

#### Backend Tasks
| # | Tarefa | Estimativa | Responsável |
|---|--------|------------|-------------|
| T040 | Criar tabela `carrinho` (se não usar localStorage) | 2h | Backend |
| T041 | Criar endpoint POST /api/carrinho | 3h | Backend |
| T042 | Validar estoque disponível | 2h | Backend |
| T043 | Retornar carrinho atualizado | 1h | Backend |

#### Frontend Tasks
| # | Tarefa | Estimativa | Responsável |
|---|--------|------------|-------------|
| T044 | Criar store Zustand para carrinho | 3h | Frontend |
| T045 | Criar ação `adicionarAoCarrinho` | 2h | Frontend |
| T046 | Adicionar botão "Adicionar" nos cards | 1h | Frontend |
| T047 | Implementar feedback visual (toast/animação) | 2h | Frontend |
| T048 | Atualizar badge do carrinho no header | 1h | Frontend |

#### QA Tasks
| # | Tarefa | Estimativa | Responsável |
|---|--------|------------|-------------|
| T049 | Testar adição de produto | 1h | QA |
| T050 | Testar limite de estoque | 1h | QA |
| T051 | Testar feedback visual | 1h | QA |
| T052 | Testar produtos duplicados | 1h | QA |

**Total: 22 horas**

---

### 📋 US12 - Finalizar Pedido (8 pts / 32h)

#### Backend Tasks
| # | Tarefa | Estimativa | Responsável |
|---|--------|------------|-------------|
| T053 | Criar endpoint POST /api/pedidos | 4h | Backend |
| T054 | Validar dados de entrega | 2h | Backend |
| T055 | Integrar API ViaCEP | 3h | Backend |
| T056 | Calcular total do pedido | 2h | Backend |
| T057 | Criar registros `pedidos` e `itens_pedido` | 3h | Backend |
| T058 | Decrementar estoque | 2h | Backend |
| T059 | Enviar e-mail de confirmação | 2h | Backend |

#### Frontend Tasks
| # | Tarefa | Estimativa | Responsável |
|---|--------|------------|-------------|
| T060 | Criar página/modal de checkout | 4h | Frontend |
| T061 | Criar formulário de endereço | 2h | Frontend |
| T062 | Implementar validação de CEP em tempo real | 2h | Frontend |
| T063 | Exibir resumo do pedido | 2h | Frontend |
| T064 | Integrar com endpoint de criação | 2h | Frontend |
| T065 | Redirecionar para pagamento | 1h | Frontend |

#### QA Tasks
| # | Tarefa | Estimativa | Responsável |
|---|--------|------------|-------------|
| T066 | Testar checkout completo | 2h | QA |
| T067 | Testar validação de CEP | 1h | QA |
| T068 | Testar criação de pedido no banco | 1h | QA |

**Total: 32 horas**

---

### 📋 US17 - Pagamento PIX (13 pts / 40h)

#### Backend Tasks
| # | Tarefa | Estimativa | Responsável |
|---|--------|------------|-------------|
| T069 | Integrar SDK MercadoPago/PagSeguro | 8h | Backend |
| T070 | Criar endpoint POST /api/pagamento/pix | 4h | Backend |
| T071 | Gerar QR Code PIX | 4h | Backend |
| T072 | Criar webhook para confirmação | 6h | Backend |
| T073 | Atualizar status do pedido | 2h | Backend |
| T074 | Enviar notificação de pagamento | 2h | Backend |

#### Frontend Tasks
| # | Tarefa | Estimativa | Responsável |
|---|--------|------------|-------------|
| T075 | Criar tela de pagamento PIX | 3h | Frontend |
| T076 | Exibir QR Code e chave copiável | 2h | Frontend |
| T077 | Implementar polling para detectar pagamento | 3h | Frontend |
| T078 | Exibir timer de expiração (15min) | 2h | Frontend |
| T079 | Redirecionar para confirmação | 1h | Frontend |

#### QA Tasks
| # | Tarefa | Estimativa | Responsável |
|---|--------|------------|-------------|
| T080 | Testar geração de QR Code | 1h | QA |
| T081 | Testar webhook em sandbox | 2h | QA |

**Total: 40 horas**

---

## 5. Resumo de Estimativas

### Por Épico

| Épico | Story Points | Horas Estimadas | Sprints |
|-------|--------------|-----------------|---------|
| EP01 - Vitrine | 24 | ~96h | 1-2 |
| EP02 - Pedidos | 43 | ~172h | 2-5 |
| EP03 - Pagamento | 44 | ~140h | 4 |
| EP04 - Entrega | 29 | ~116h | 5 |
| EP05 - Cliente | 28 | ~112h | 1, 7 |
| EP06 - Admin | 29 | ~116h | 6 |
| **TOTAL** | **197** | **~752h** | **8 sprints** |

### Por Disciplina

| Disciplina | Horas | % |
|------------|-------|---|
| Backend | ~300h | 40% |
| Frontend | ~360h | 48% |
| QA | ~92h | 12% |
| **TOTAL** | **752h** | **100%** |

### Por Sprint (MVP - Sprints 1-6)

| Sprint | Story Points | Horas | Histórias |
|--------|--------------|-------|-----------|
| Sprint 1 | 23 | ~92h | 5 |
| Sprint 2 | 22 | ~88h | 6 |
| Sprint 3 | 21 | ~84h | 3 |
| Sprint 4 | 26 | ~92h | 3 |
| Sprint 5 | 19 | ~76h | 4 |
| Sprint 6 | 21 | ~84h | 3 |
| **TOTAL MVP** | **132** | **516h** | **24** |

---

## 6. Observações Importantes

### Premissas das Estimativas

1. **Time completo:** 1 Backend + 1 Frontend + 1 QA
2. **Velocidade:** ~4 story points por semana por pessoa
3. **Sprint:** 2 semanas (10 dias úteis)
4. **Horas por dia:** 6h produtivas

### Riscos de Prazo

🔴 **Alto Risco:**
- US17, US18 (Integração pagamento)
- US12 (Complexidade do checkout)

🟡 **Médio Risco:**
- US23 (Sistema de notificações)
- US32 (Upload de imagens)

### Recomendações

1. **Priorizar testes:** Pagamento e checkout são críticos
2. **Usar sandbox:** Testar integrações em ambiente de desenvolvimento
3. **Code review:** Todas alterações em autenticação e pagamento
4. **Pair programming:** Features complexas (checkout, PIX)

---

**Documento criado em:** 22/10/2025
**Versão:** 1.0
**Próxima revisão:** Após cada sprint
