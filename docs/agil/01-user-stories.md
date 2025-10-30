# Ed Cupcakes - Cartões de História de Usuário (User Stories)

## 1. Introdução

Este documento contém todos os **User Stories** (Histórias de Usuário) levantados para o sistema de loja virtual de cupcakes gourmet **Ed Cupcakes**.

As histórias foram criadas seguindo o formato padrão:
> **Como** [tipo de usuário],
> **Quero** [realizar uma ação],
> **Para** [alcançar um benefício/objetivo].

Cada história possui:
- **ID único**
- **Título**
- **Descrição** (formato padrão)
- **Critérios de Aceitação** (cenários de teste)
- **Prioridade** (Alta, Média, Baixa)
- **Estimativa** (Story Points usando Fibonacci: 1, 2, 3, 5, 8, 13)
- **Tema/Épico** associado

---

## 2. Épicos do Projeto

### EP01 - Vitrine Virtual
Funcionalidades relacionadas à exibição e navegação dos produtos.

### EP02 - Gestão de Pedidos
Funcionalidades de criação, acompanhamento e gestão de pedidos.

### EP03 - Pagamento
Funcionalidades relacionadas ao processo de pagamento.

### EP04 - Entrega
Funcionalidades de logística e entrega dos produtos.

### EP05 - Conta do Cliente
Funcionalidades de gestão de perfil e autenticação.

### EP06 - Gestão Administrativa
Funcionalidades para administradores gerenciarem a loja.

---

## 3. User Stories - Vitrine Virtual (EP01)

### US01 - Visualizar Catálogo de Cupcakes

**Como** cliente visitante,
**Quero** visualizar todos os cupcakes disponíveis na loja,
**Para** conhecer os produtos e decidir o que comprar.

**Critérios de Aceitação:**
- [ ] O catálogo deve exibir todos os cupcakes ativos
- [ ] Cada cupcake deve mostrar: foto, nome, preço e avaliação
- [ ] Deve haver indicação visual se o produto está esgotado
- [ ] O layout deve ser em grid responsivo
- [ ] Deve carregar em menos de 3 segundos

**Prioridade:** Alta
**Estimativa:** 5 pontos
**Épico:** EP01 - Vitrine Virtual

---

### US02 - Filtrar Cupcakes por Categoria

**Como** cliente,
**Quero** filtrar os cupcakes por categoria (Chocolate, Frutas, Especiais, etc.),
**Para** encontrar rapidamente o tipo de cupcake que desejo.

**Critérios de Aceitação:**
- [ ] Deve haver menu lateral com todas as categorias
- [ ] Ao clicar em uma categoria, exibir apenas produtos daquela categoria
- [ ] Deve haver opção "Todos" para limpar filtro
- [ ] A filtragem deve ser instantânea (sem reload)
- [ ] Categorias sem produtos devem estar desabilitadas

**Prioridade:** Alta
**Estimativa:** 3 pontos
**Épico:** EP01 - Vitrine Virtual

---

### US03 - Buscar Cupcakes por Nome

**Como** cliente,
**Quero** buscar cupcakes pelo nome ou descrição,
**Para** encontrar rapidamente um produto específico.

**Critérios de Aceitação:**
- [ ] Campo de busca visível no topo da página
- [ ] Busca deve acontecer em tempo real (ao digitar)
- [ ] Deve buscar em: nome, descrição e categoria
- [ ] Deve exibir mensagem se não encontrar resultados
- [ ] Deve limpar busca ao clicar no X

**Prioridade:** Média
**Estimativa:** 3 pontos
**Épico:** EP01 - Vitrine Virtual

---

### US04 - Ver Detalhes do Cupcake

**Como** cliente,
**Quero** clicar em um cupcake e ver seus detalhes completos,
**Para** conhecer melhor o produto antes de comprar.

**Critérios de Aceitação:**
- [ ] Ao clicar no card, abrir modal ou página de detalhes
- [ ] Exibir: foto ampliada, nome, descrição completa, preço, categoria
- [ ] Exibir disponibilidade em estoque
- [ ] Exibir avaliações de outros clientes
- [ ] Ter botão "Adicionar ao Carrinho"
- [ ] Ter botão "Adicionar aos Favoritos"

**Prioridade:** Alta
**Estimativa:** 5 pontos
**Épico:** EP01 - Vitrine Virtual

---

### US05 - Visualizar Cupcakes em Destaque

**Como** cliente,
**Quero** ver cupcakes em destaque na página inicial,
**Para** conhecer as novidades e produtos mais vendidos.

**Critérios de Aceitação:**
- [ ] Seção "Destaques" no topo da página inicial
- [ ] Exibir até 6 cupcakes em destaque
- [ ] Destacar visualmente (badge "Novo", "Mais vendido", etc.)
- [ ] Produtos em destaque devem ser configuráveis pelo admin

**Prioridade:** Média
**Estimativa:** 3 pontos
**Épico:** EP01 - Vitrine Virtual

---

### US06 - Ver Avaliações de Clientes

**Como** cliente,
**Quero** ler avaliações de outros clientes sobre os cupcakes,
**Para** tomar decisão de compra mais informada.

**Critérios de Aceitação:**
- [ ] Exibir nota média (1-5 estrelas) em cada produto
- [ ] Exibir número total de avaliações
- [ ] Na página de detalhes, listar todas avaliações
- [ ] Cada avaliação deve ter: nota, comentário, nome do cliente, data
- [ ] Avaliações ordenadas por mais recentes primeiro

**Prioridade:** Média
**Estimativa:** 5 pontos
**Épico:** EP01 - Vitrine Virtual

---

## 4. User Stories - Gestão de Pedidos (EP02)

### US07 - Adicionar Cupcake ao Carrinho

**Como** cliente,
**Quero** adicionar cupcakes ao meu carrinho de compras,
**Para** acumular produtos antes de finalizar a compra.

**Critérios de Aceitação:**
- [ ] Botão "Adicionar ao Carrinho" visível em cada produto
- [ ] Permitir escolher quantidade antes de adicionar
- [ ] Exibir feedback visual ao adicionar (animação, toast)
- [ ] Atualizar contador do carrinho no header
- [ ] Não permitir adicionar se estoque esgotado

**Prioridade:** Alta
**Estimativa:** 5 pontos
**Épico:** EP02 - Gestão de Pedidos

---

### US08 - Visualizar Carrinho de Compras

**Como** cliente,
**Quero** visualizar todos os itens do meu carrinho,
**Para** revisar minha compra antes de finalizar.

**Critérios de Aceitação:**
- [ ] Ícone de carrinho no header com badge de quantidade
- [ ] Ao clicar, abrir modal/drawer com itens do carrinho
- [ ] Exibir: foto, nome, quantidade, preço unitário, subtotal
- [ ] Exibir valor total do carrinho
- [ ] Ter botão "Finalizar Pedido"
- [ ] Ter botão "Continuar Comprando"

**Prioridade:** Alta
**Estimativa:** 5 pontos
**Épico:** EP02 - Gestão de Pedidos

---

### US09 - Alterar Quantidade no Carrinho

**Como** cliente,
**Quero** aumentar ou diminuir a quantidade de itens no carrinho,
**Para** ajustar minha compra sem ter que remover e adicionar novamente.

**Critérios de Aceitação:**
- [ ] Botões "-" e "+" ao lado de cada item
- [ ] Recalcular subtotal e total automaticamente
- [ ] Não permitir quantidade < 1
- [ ] Não permitir quantidade > estoque disponível
- [ ] Exibir alerta se tentar exceder estoque

**Prioridade:** Alta
**Estimativa:** 3 pontos
**Épico:** EP02 - Gestão de Pedidos

---

### US10 - Remover Item do Carrinho

**Como** cliente,
**Quero** remover um item do carrinho,
**Para** não comprar produtos que não quero mais.

**Critérios de Aceitação:**
- [ ] Botão de remoção (ícone lixeira) em cada item
- [ ] Pedir confirmação antes de remover
- [ ] Atualizar total do carrinho após remoção
- [ ] Atualizar contador do header
- [ ] Se carrinho ficar vazio, exibir mensagem apropriada

**Prioridade:** Alta
**Estimativa:** 2 pontos
**Épico:** EP02 - Gestão de Pedidos

---

### US11 - Adicionar Observações ao Pedido

**Como** cliente,
**Quero** adicionar observações ou instruções especiais ao meu pedido,
**Para** personalizar minha compra (ex: "Sem açúcar", "Dobrar cobertura").

**Critérios de Aceitação:**
- [ ] Campo de texto no carrinho ou checkout para observações
- [ ] Limite de 500 caracteres
- [ ] Observação deve aparecer no pedido final
- [ ] Opcional (não obrigatório)

**Prioridade:** Média
**Estimativa:** 2 pontos
**Épico:** EP02 - Gestão de Pedidos

---

### US12 - Finalizar Pedido (Checkout)

**Como** cliente autenticado,
**Quero** finalizar meu pedido informando dados de entrega,
**Para** receber os cupcakes no meu endereço.

**Critérios de Aceitação:**
- [ ] Exibir resumo dos itens do carrinho
- [ ] Solicitar/confirmar endereço de entrega
- [ ] Solicitar/confirmar CEP
- [ ] Validar CEP usando API externa (ViaCEP)
- [ ] Permitir adicionar observações finais
- [ ] Exibir valor total + frete
- [ ] Botão "Confirmar Pedido"
- [ ] Redirecionar para pagamento após confirmação

**Prioridade:** Alta
**Estimativa:** 8 pontos
**Épico:** EP02 - Gestão de Pedidos

---

### US13 - Visualizar Meus Pedidos

**Como** cliente autenticado,
**Quero** ver o histórico de todos os meus pedidos,
**Para** acompanhar entregas e consultar compras anteriores.

**Critérios de Aceitação:**
- [ ] Menu "Meus Pedidos" na área do cliente
- [ ] Listar todos os pedidos ordenados por data (mais recente primeiro)
- [ ] Exibir: número do pedido, data, status, valor total
- [ ] Status com cores diferentes (pendente, em preparo, enviado, entregue)
- [ ] Permitir clicar para ver detalhes do pedido

**Prioridade:** Alta
**Estimativa:** 5 pontos
**Épico:** EP02 - Gestão de Pedidos

---

### US14 - Ver Detalhes de um Pedido Específico

**Como** cliente autenticado,
**Quero** ver todos os detalhes de um pedido específico,
**Para** conferir o que comprei e acompanhar a entrega.

**Critérios de Aceitação:**
- [ ] Exibir número do pedido e data
- [ ] Listar todos os itens (foto, nome, quantidade, preço)
- [ ] Exibir status atual do pedido
- [ ] Exibir endereço de entrega
- [ ] Exibir observações (se houver)
- [ ] Exibir valor total
- [ ] Exibir histórico de status (se possível)

**Prioridade:** Alta
**Estimativa:** 5 pontos
**Épico:** EP02 - Gestão de Pedidos

---

### US15 - Cancelar Pedido Pendente

**Como** cliente autenticado,
**Quero** cancelar um pedido que ainda está pendente,
**Para** desistir da compra caso mude de ideia.

**Critérios de Aceitação:**
- [ ] Botão "Cancelar Pedido" visível apenas se status = "pendente"
- [ ] Pedir confirmação antes de cancelar
- [ ] Atualizar status para "cancelado"
- [ ] Exibir mensagem de sucesso
- [ ] Não permitir cancelar pedidos já "em preparo" ou além

**Prioridade:** Média
**Estimativa:** 3 pontos
**Épico:** EP02 - Gestão de Pedidos

---

## 5. User Stories - Pagamento (EP03)

### US16 - Escolher Forma de Pagamento

**Como** cliente,
**Quero** escolher a forma de pagamento (PIX, Cartão, Dinheiro na entrega),
**Para** pagar da maneira mais conveniente para mim.

**Critérios de Aceitação:**
- [ ] Exibir opções: PIX, Cartão de Crédito, Dinheiro na Entrega
- [ ] Apenas uma opção pode ser selecionada
- [ ] Cada opção deve ter ícone visual claro
- [ ] Se "Dinheiro", perguntar se precisa troco
- [ ] Se "Cartão", exibir formulário de dados do cartão
- [ ] Se "PIX", gerar QR Code ou chave PIX

**Prioridade:** Alta
**Estimativa:** 8 pontos
**Épico:** EP03 - Pagamento

---

### US17 - Processar Pagamento via PIX

**Como** cliente,
**Quero** pagar via PIX,
**Para** ter confirmação imediata do pagamento.

**Critérios de Aceitação:**
- [ ] Gerar QR Code PIX com valor do pedido
- [ ] Exibir chave PIX copiável
- [ ] Exibir timer de validade (15 minutos)
- [ ] Confirmar pagamento automaticamente ao detectar transferência
- [ ] Atualizar status do pedido para "confirmado" após pagamento
- [ ] Enviar e-mail de confirmação

**Prioridade:** Alta
**Estimativa:** 13 pontos
**Épico:** EP03 - Pagamento

---

### US18 - Processar Pagamento com Cartão

**Como** cliente,
**Quero** pagar com cartão de crédito,
**Para** parcelar minha compra se necessário.

**Critérios de Aceitação:**
- [ ] Formulário seguro para dados do cartão (número, CVV, validade)
- [ ] Validar número do cartão (Luhn algorithm)
- [ ] Não armazenar dados do cartão (compliance PCI)
- [ ] Integrar com gateway de pagamento (Stripe, MercadoPago, etc.)
- [ ] Exibir opções de parcelamento
- [ ] Confirmar pagamento em até 30 segundos
- [ ] Atualizar status do pedido

**Prioridade:** Média
**Estimativa:** 13 pontos
**Épico:** EP03 - Pagamento

---

### US19 - Confirmar Pagamento em Dinheiro na Entrega

**Como** cliente,
**Quero** pagar em dinheiro na entrega,
**Para** não precisar fazer transação online.

**Critérios de Aceitação:**
- [ ] Opção "Dinheiro na Entrega" no checkout
- [ ] Perguntar se precisa de troco e para quanto
- [ ] Informar valor exato do pedido
- [ ] Pedido confirmado mas com status "pagamento pendente"
- [ ] Entregador deve confirmar pagamento no app
- [ ] Status atualizado para "pago" após confirmação do entregador

**Prioridade:** Média
**Estimativa:** 5 pontos
**Épico:** EP03 - Pagamento

---

### US20 - Receber Comprovante de Pagamento

**Como** cliente,
**Quero** receber um comprovante digital do pagamento,
**Para** ter registro da transação.

**Critérios de Aceitação:**
- [ ] Gerar comprovante em PDF após pagamento confirmado
- [ ] Comprovante deve conter: número pedido, data, itens, valor total, forma de pagamento
- [ ] Enviar comprovante por e-mail
- [ ] Permitir download do comprovante na área do cliente

**Prioridade:** Baixa
**Estimativa:** 5 pontos
**Épico:** EP03 - Pagamento

---

## 6. User Stories - Entrega (EP04)

### US21 - Calcular Frete por CEP

**Como** cliente,
**Quero** ver o valor do frete baseado no meu CEP,
**Para** saber o custo total antes de finalizar a compra.

**Critérios de Aceitação:**
- [ ] Campo para inserir CEP no checkout
- [ ] Calcular frete automaticamente ao informar CEP válido
- [ ] Exibir valor do frete separadamente
- [ ] Somar frete ao total do pedido
- [ ] Informar prazo estimado de entrega
- [ ] Exibir erro se CEP fora da área de entrega

**Prioridade:** Alta
**Estimativa:** 8 pontos
**Épico:** EP04 - Entrega

---

### US22 - Escolher Horário de Entrega

**Como** cliente,
**Quero** escolher um período preferencial para receber minha entrega,
**Para** estar disponível quando os cupcakes chegarem.

**Critérios de Aceitação:**
- [ ] Opções: Manhã (8h-12h), Tarde (12h-18h), Noite (18h-22h)
- [ ] Não permitir horários no mesmo dia se pedido após 14h
- [ ] Exibir calendário para escolher data de entrega
- [ ] Mínimo 24h de antecedência para produção
- [ ] Máximo 7 dias de antecedência

**Prioridade:** Média
**Estimativa:** 5 pontos
**Épico:** EP04 - Entrega

---

### US23 - Acompanhar Status da Entrega

**Como** cliente,
**Quero** acompanhar em tempo real o status da entrega,
**Para** saber quando meu pedido chegará.

**Critérios de Aceitação:**
- [ ] Exibir status atual: Pendente → Confirmado → Em Preparo → Saiu para Entrega → Entregue
- [ ] Cada status com ícone e cor diferentes
- [ ] Exibir data/hora de cada mudança de status
- [ ] Enviar notificação por e-mail a cada mudança de status
- [ ] (Opcional) Rastreamento em mapa se integrado

**Prioridade:** Alta
**Estimativa:** 8 pontos
**Épico:** EP04 - Entrega

---

### US24 - Confirmar Recebimento

**Como** cliente,
**Quero** confirmar que recebi meu pedido,
**Para** finalizar a transação e poder avaliar os produtos.

**Critérios de Aceitação:**
- [ ] Botão "Confirmar Recebimento" quando status = "Saiu para Entrega"
- [ ] Ao confirmar, status muda para "Entregue"
- [ ] Liberar opção de avaliar produtos
- [ ] Registrar data/hora do recebimento
- [ ] Enviar e-mail agradecendo pela compra

**Prioridade:** Média
**Estimativa:** 3 pontos
**Épico:** EP04 - Entrega

---

### US25 - Reagendar Entrega

**Como** cliente,
**Quero** reagendar a data de entrega,
**Para** receber em outro dia caso eu não esteja disponível.

**Critérios de Aceitação:**
- [ ] Opção "Reagendar" disponível até 4h antes da entrega
- [ ] Exibir calendário com datas disponíveis
- [ ] Atualizar data no pedido
- [ ] Enviar notificação ao admin/entregador
- [ ] Enviar e-mail de confirmação ao cliente
- [ ] Não permitir reagendar pedidos já "Saiu para Entrega"

**Prioridade:** Baixa
**Estimativa:** 5 pontos
**Épico:** EP04 - Entrega

---

## 7. User Stories - Conta do Cliente (EP05)

### US26 - Criar Conta de Cliente

**Como** visitante,
**Quero** criar uma conta na loja,
**Para** fazer pedidos e acompanhar minhas compras.

**Critérios de Aceitação:**
- [ ] Formulário com: nome completo, e-mail, senha, telefone
- [ ] Validar formato de e-mail
- [ ] Senha com mínimo 8 caracteres
- [ ] Verificar se e-mail já existe
- [ ] Enviar e-mail de confirmação
- [ ] Fazer login automático após cadastro
- [ ] Criptografar senha com bcrypt

**Prioridade:** Alta
**Estimativa:** 5 pontos
**Épico:** EP05 - Conta do Cliente

---

### US27 - Fazer Login

**Como** cliente cadastrado,
**Quero** fazer login na minha conta,
**Para** acessar meus pedidos e dados pessoais.

**Critérios de Aceitação:**
- [ ] Formulário com e-mail e senha
- [ ] Validar credenciais no banco
- [ ] Gerar token JWT ao autenticar
- [ ] Redirecionar para página inicial após login
- [ ] Exibir erro se credenciais inválidas
- [ ] Opção "Lembrar-me" para persistir sessão

**Prioridade:** Alta
**Estimativa:** 5 pontos
**Épico:** EP05 - Conta do Cliente

---

### US28 - Recuperar Senha

**Como** cliente que esqueceu a senha,
**Quero** recuperar minha senha via e-mail,
**Para** voltar a acessar minha conta.

**Critérios de Aceitação:**
- [ ] Link "Esqueci minha senha" na tela de login
- [ ] Solicitar e-mail cadastrado
- [ ] Enviar link de redefinição por e-mail
- [ ] Link válido por 1 hora
- [ ] Permitir criar nova senha
- [ ] Invalidar senha antiga após redefinição

**Prioridade:** Média
**Estimativa:** 5 pontos
**Épico:** EP05 - Conta do Cliente

---

### US29 - Editar Perfil

**Como** cliente autenticado,
**Quero** editar meus dados cadastrais,
**Para** manter minhas informações atualizadas.

**Critérios de Aceitação:**
- [ ] Permitir editar: nome, telefone, endereço, CEP
- [ ] Não permitir alterar e-mail (ou pedir reconfirmação)
- [ ] Validar campos antes de salvar
- [ ] Exibir mensagem de sucesso ao salvar
- [ ] Atualizar dados em tempo real

**Prioridade:** Média
**Estimativa:** 3 pontos
**Épico:** EP05 - Conta do Cliente

---

### US30 - Adicionar aos Favoritos

**Como** cliente autenticado,
**Quero** marcar cupcakes como favoritos,
**Para** encontrá-los rapidamente depois.

**Critérios de Aceitação:**
- [ ] Ícone de coração em cada produto
- [ ] Clicar no coração adiciona/remove dos favoritos
- [ ] Feedback visual ao favoritar (coração preenchido)
- [ ] Menu "Meus Favoritos" no perfil do cliente
- [ ] Listar todos os produtos favoritados

**Prioridade:** Média
**Estimativa:** 5 pontos
**Épico:** EP05 - Conta do Cliente

---

### US31 - Avaliar Produto Comprado

**Como** cliente que recebeu um pedido,
**Quero** avaliar os cupcakes que comprei,
**Para** compartilhar minha experiência com outros clientes.

**Critérios de Aceitação:**
- [ ] Opção "Avaliar" disponível após receber pedido
- [ ] Formulário com nota (1-5 estrelas) e comentário opcional
- [ ] Não permitir avaliar se pedido não foi entregue
- [ ] Exibir avaliação na página do produto
- [ ] Permitir editar avaliação posteriormente

**Prioridade:** Média
**Estimativa:** 5 pontos
**Épico:** EP05 - Conta do Cliente

---

## 8. User Stories - Gestão Administrativa (EP06)

### US32 - Gerenciar Produtos (Admin)

**Como** administrador,
**Quero** adicionar, editar e remover produtos do catálogo,
**Para** manter a oferta de cupcakes atualizada.

**Critérios de Aceitação:**
- [ ] CRUD completo de produtos
- [ ] Formulário com: nome, descrição, preço, categoria, estoque, imagem
- [ ] Upload de imagem do produto
- [ ] Ativar/desativar produto (soft delete)
- [ ] Validar campos obrigatórios
- [ ] Apenas admins podem acessar

**Prioridade:** Alta
**Estimativa:** 8 pontos
**Épico:** EP06 - Gestão Administrativa

---

### US33 - Gerenciar Pedidos (Admin)

**Como** administrador,
**Quero** visualizar e gerenciar todos os pedidos,
**Para** processar entregas e atualizar status.

**Critérios de Aceitação:**
- [ ] Listar todos os pedidos do sistema
- [ ] Filtrar por status, data, cliente
- [ ] Atualizar status do pedido
- [ ] Ver detalhes completos de cada pedido
- [ ] Cancelar pedido se necessário
- [ ] Notificar cliente ao mudar status

**Prioridade:** Alta
**Estimativa:** 8 pontos
**Épico:** EP06 - Gestão Administrativa

---

### US34 - Visualizar Relatórios de Vendas (Admin)

**Como** administrador,
**Quero** visualizar relatórios de vendas e estatísticas,
**Para** tomar decisões de negócio.

**Critérios de Aceitação:**
- [ ] Relatório de vendas por período (dia, semana, mês)
- [ ] Produtos mais vendidos
- [ ] Receita total
- [ ] Avaliação média dos produtos
- [ ] Gráficos visuais (barras, pizza, linha)
- [ ] Exportar relatório em PDF ou Excel

**Prioridade:** Baixa
**Estimativa:** 8 pontos
**Épico:** EP06 - Gestão Administrativa

---

### US35 - Gerenciar Estoque (Admin)

**Como** administrador,
**Quero** controlar o estoque de cada produto,
**Para** evitar vender cupcakes indisponíveis.

**Critérios de Aceitação:**
- [ ] Atualizar quantidade em estoque manualmente
- [ ] Estoque é decrementado automaticamente ao confirmar pedido
- [ ] Alertas quando estoque < 5 unidades
- [ ] Histórico de movimentações de estoque
- [ ] Produtos com estoque = 0 aparecem como "Esgotado"

**Prioridade:** Alta
**Estimativa:** 5 pontos
**Épico:** EP06 - Gestão Administrativa

---

## 9. Resumo Quantitativo

| Épico | Quantidade de Histórias | Story Points Total |
|-------|------------------------|-------------------|
| EP01 - Vitrine Virtual | 6 | 24 |
| EP02 - Gestão de Pedidos | 9 | 43 |
| EP03 - Pagamento | 5 | 44 |
| EP04 - Entrega | 5 | 29 |
| EP05 - Conta do Cliente | 6 | 28 |
| EP06 - Gestão Admin | 4 | 29 |
| **TOTAL** | **35 User Stories** | **197 Story Points** |

---

## 10. Observações Importantes

### Priorização MoSCoW
- **Must Have (Alta):** 20 histórias - Funcionalidades essenciais para o MVP
- **Should Have (Média):** 12 histórias - Importantes mas não bloqueiam lançamento
- **Could Have (Baixa):** 3 histórias - Desejáveis para versões futuras

### Complexidade
- **Simples (1-3 pontos):** 13 histórias
- **Média (5-8 pontos):** 18 histórias
- **Complexa (13 pontos):** 2 histórias (integrações de pagamento)

### Dependências Críticas
1. **US26 e US27** (Criar Conta e Login) devem ser implementadas primeiro
2. **US07 e US08** (Carrinho) são pré-requisitos para checkout
3. **US12** (Checkout) depende de autenticação
4. **US16-19** (Pagamento) são críticas para conversão
5. **US23** (Acompanhamento) depende de sistema de status

---

**Documento criado em:** 22/10/2025
**Versão:** 1.0
**Status:** ✅ Aprovado para Backlog
