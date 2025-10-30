# Ed Cupcakes - Dicionário de Dados

## 1. Informações Gerais

**Projeto:** Ed Cupcakes - Loja Virtual Gourmet
**Banco de Dados:** PostgreSQL 15+ (Supabase)
**Versão do Schema:** 1.0
**Data de Criação:** 22/10/2025
**Última Atualização:** 22/10/2025

---

## 2. Tabelas do Sistema

### 2.1 USUARIOS

**Descrição:** Armazena informações dos usuários do sistema, incluindo clientes e administradores.

**Nome Físico:** `usuarios`

**Chave Primária:** `id`

**Chaves Estrangeiras:** Nenhuma

**Índices:**
- `usuarios_pkey` (PRIMARY KEY) em `id`
- `usuarios_email_key` (UNIQUE) em `email`

#### Colunas

| Nome | Tipo | Tamanho | Nulo | Padrão | Descrição |
|------|------|---------|------|--------|-----------|
| **id** | UUID | 16 bytes | NÃO | `gen_random_uuid()` | Identificador único do usuário (PK) |
| **nome** | TEXT | Variável | NÃO | - | Nome completo do usuário |
| **email** | TEXT | Variável | NÃO | - | Endereço de e-mail único para login |
| **telefone** | TEXT | Variável | SIM | NULL | Telefone de contato com DDD |
| **endereco** | TEXT | Variável | SIM | NULL | Endereço completo de entrega padrão |
| **cep** | TEXT | Variável | SIM | NULL | CEP do endereço no formato 00000-000 |
| **eh_admin** | BOOLEAN | 1 byte | SIM | `false` | Indica se o usuário tem privilégios administrativos |
| **criado_em** | TIMESTAMPTZ | 8 bytes | SIM | `now()` | Data e hora de criação do registro |
| **atualizado_em** | TIMESTAMPTZ | 8 bytes | SIM | `now()` | Data e hora da última atualização (trigger) |

#### Restrições

**Constraints:**
- `usuarios_pkey`: PRIMARY KEY (id)
- `usuarios_email_key`: UNIQUE (email)

**Triggers:**
- `trigger_atualizar_usuarios`: Atualiza automaticamente `atualizado_em` antes de UPDATE

**Row Level Security (RLS):**
- ✅ Habilitado
- Políticas:
  - Usuários podem visualizar apenas seu próprio perfil
  - Admins podem visualizar todos os perfis
  - Usuários podem atualizar apenas seu próprio perfil

#### Regras de Negócio
- RN01: E-mail deve ser único no sistema
- RN02: E-mail é obrigatório para autenticação
- RN03: Novos usuários são criados como `eh_admin = false` por padrão
- RN04: CEP deve seguir formato brasileiro (opcional)

#### Valores Permitidos
- **eh_admin:** `true` (administrador) | `false` (cliente padrão)

#### Observações
- O campo `id` corresponde ao `auth.uid()` do Supabase Auth
- Senha não é armazenada nesta tabela (gerenciada pelo Supabase Auth)
- Dados sensíveis protegidos por RLS

---

### 2.2 PRODUTOS

**Descrição:** Catálogo de cupcakes disponíveis para venda na loja.

**Nome Físico:** `produtos`

**Chave Primária:** `id`

**Chaves Estrangeiras:** Nenhuma

**Índices:**
- `produtos_pkey` (PRIMARY KEY) em `id`
- `idx_produtos_categoria` (INDEX) em `categoria`
- `idx_produtos_ativo` (INDEX) em `ativo`

#### Colunas

| Nome | Tipo | Tamanho | Nulo | Padrão | Descrição |
|------|------|---------|------|--------|-----------|
| **id** | UUID | 16 bytes | NÃO | `gen_random_uuid()` | Identificador único do produto (PK) |
| **nome** | TEXT | Variável | NÃO | - | Nome comercial do cupcake |
| **descricao** | TEXT | Variável | NÃO | - | Descrição detalhada do produto |
| **preco** | NUMERIC(10,2) | 10 dígitos | NÃO | - | Preço unitário em reais (R$) |
| **imagem_url** | TEXT | Variável | SIM | NULL | URL da imagem do produto |
| **categoria** | TEXT | Variável | NÃO | - | Categoria do cupcake |
| **estoque** | INTEGER | 4 bytes | SIM | `0` | Quantidade disponível em estoque |
| **ativo** | BOOLEAN | 1 byte | SIM | `true` | Indica se o produto está disponível para venda |
| **criado_em** | TIMESTAMPTZ | 8 bytes | SIM | `now()` | Data e hora de criação do produto |
| **atualizado_em** | TIMESTAMPTZ | 8 bytes | SIM | `now()` | Data e hora da última atualização (trigger) |

#### Restrições

**Constraints:**
- `produtos_pkey`: PRIMARY KEY (id)
- `produtos_preco_check`: CHECK (preco >= 0)
- `produtos_estoque_check`: CHECK (estoque >= 0)

**Triggers:**
- `trigger_atualizar_produtos`: Atualiza automaticamente `atualizado_em` antes de UPDATE

**Row Level Security (RLS):**
- ✅ Habilitado
- Políticas:
  - Usuários autenticados podem visualizar produtos ativos
  - Admins podem visualizar todos os produtos
  - Apenas admins podem inserir, atualizar ou deletar produtos

#### Regras de Negócio
- RN05: Preço deve ser maior ou igual a zero
- RN06: Estoque não pode ser negativo
- RN07: Produtos inativos não aparecem no catálogo público
- RN08: Categoria é obrigatória para organização

#### Valores Permitidos
- **categoria:** Valores sugeridos (não constraint):
  - `Chocolate`
  - `Frutas`
  - `Especiais`
  - `Festas`
  - `Veganos`
  - Outros valores podem ser adicionados
- **ativo:** `true` (visível no catálogo) | `false` (oculto)

#### Observações
- Produtos inativos permanecem no banco para preservar histórico de pedidos
- Imagens devem ser hospedadas externamente (Supabase Storage, CDN, etc.)
- Preço armazenado com 2 casas decimais para valores monetários

---

### 2.3 PEDIDOS

**Descrição:** Registra todos os pedidos realizados pelos clientes na plataforma.

**Nome Físico:** `pedidos`

**Chave Primária:** `id`

**Chaves Estrangeiras:**
- `usuario_id` → `usuarios(id)`

**Índices:**
- `pedidos_pkey` (PRIMARY KEY) em `id`
- `idx_pedidos_usuario` (INDEX) em `usuario_id`
- `idx_pedidos_status` (INDEX) em `status`

#### Colunas

| Nome | Tipo | Tamanho | Nulo | Padrão | Descrição |
|------|------|---------|------|--------|-----------|
| **id** | UUID | 16 bytes | NÃO | `gen_random_uuid()` | Identificador único do pedido (PK) |
| **usuario_id** | UUID | 16 bytes | NÃO | - | Referência ao cliente que fez o pedido (FK) |
| **status** | TEXT | Variável | SIM | `'pendente'` | Status atual do pedido |
| **total** | NUMERIC(10,2) | 10 dígitos | NÃO | - | Valor total do pedido em reais (R$) |
| **endereco_entrega** | TEXT | Variável | NÃO | - | Endereço completo para entrega |
| **cep_entrega** | TEXT | Variável | NÃO | - | CEP de entrega no formato 00000-000 |
| **observacoes** | TEXT | Variável | SIM | NULL | Observações adicionais do cliente |
| **criado_em** | TIMESTAMPTZ | 8 bytes | SIM | `now()` | Data e hora de criação do pedido |
| **atualizado_em** | TIMESTAMPTZ | 8 bytes | SIM | `now()` | Data e hora da última atualização (trigger) |

#### Restrições

**Constraints:**
- `pedidos_pkey`: PRIMARY KEY (id)
- `pedidos_usuario_id_fkey`: FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
- `pedidos_status_check`: CHECK (status IN ('pendente', 'confirmado', 'preparando', 'enviado', 'entregue', 'cancelado'))
- `pedidos_total_check`: CHECK (total >= 0)

**Triggers:**
- `trigger_atualizar_pedidos`: Atualiza automaticamente `atualizado_em` antes de UPDATE

**Row Level Security (RLS):**
- ✅ Habilitado
- Políticas:
  - Usuários podem visualizar apenas seus próprios pedidos
  - Admins podem visualizar todos os pedidos
  - Usuários autenticados podem criar pedidos
  - Usuários podem atualizar seus próprios pedidos (cancelar)
  - Admins podem atualizar qualquer pedido

#### Regras de Negócio
- RN09: Pedido sempre deve ter um usuário associado
- RN10: Total deve ser calculado com base nos itens do pedido
- RN11: Endereço e CEP são obrigatórios para entrega
- RN12: Status segue fluxo definido (veja máquina de estados abaixo)
- RN13: Pedidos cancelados não podem ter status alterado

#### Valores Permitidos
- **status:**
  - `pendente` - Pedido criado, aguardando confirmação
  - `confirmado` - Pedido confirmado pelo sistema/admin
  - `preparando` - Cupcakes sendo preparados
  - `enviado` - Pedido em rota de entrega
  - `entregue` - Pedido entregue ao cliente (final)
  - `cancelado` - Pedido cancelado (final)

#### Máquina de Estados

```
[Pendente] → [Confirmado] → [Preparando] → [Enviado] → [Entregue]
    ↓             ↓              ↓             ↓
    └─────────────┴──────────────┴─────────────┴─→ [Cancelado]
```

#### Observações
- Deleção em cascata: se usuário é deletado, seus pedidos também são
- Total é armazenado (desnormalização) para preservar valor no momento da compra
- Endereço é copiado do usuário mas pode ser alterado no checkout

---

### 2.4 ITENS_PEDIDO

**Descrição:** Armazena os produtos individuais de cada pedido com quantidades e preços.

**Nome Físico:** `itens_pedido`

**Chave Primária:** `id`

**Chaves Estrangeiras:**
- `pedido_id` → `pedidos(id)`
- `produto_id` → `produtos(id)`

**Índices:**
- `itens_pedido_pkey` (PRIMARY KEY) em `id`
- `idx_itens_pedido_pedido` (INDEX) em `pedido_id`
- `idx_itens_pedido_produto` (INDEX) em `produto_id`

#### Colunas

| Nome | Tipo | Tamanho | Nulo | Padrão | Descrição |
|------|------|---------|------|--------|-----------|
| **id** | UUID | 16 bytes | NÃO | `gen_random_uuid()` | Identificador único do item (PK) |
| **pedido_id** | UUID | 16 bytes | NÃO | - | Referência ao pedido (FK) |
| **produto_id** | UUID | 16 bytes | NÃO | - | Referência ao produto comprado (FK) |
| **quantidade** | INTEGER | 4 bytes | NÃO | - | Quantidade do produto no pedido |
| **preco_unitario** | NUMERIC(10,2) | 10 dígitos | NÃO | - | Preço do produto no momento da compra |
| **subtotal** | NUMERIC(10,2) | 10 dígitos | NÃO | - | Quantidade × preço unitário |
| **personalizacao** | TEXT | Variável | SIM | NULL | Observações de personalização do cliente |

#### Restrições

**Constraints:**
- `itens_pedido_pkey`: PRIMARY KEY (id)
- `itens_pedido_pedido_id_fkey`: FOREIGN KEY (pedido_id) REFERENCES pedidos(id) ON DELETE CASCADE
- `itens_pedido_produto_id_fkey`: FOREIGN KEY (produto_id) REFERENCES produtos(id)
- `itens_pedido_quantidade_check`: CHECK (quantidade > 0)
- `itens_pedido_preco_unitario_check`: CHECK (preco_unitario >= 0)
- `itens_pedido_subtotal_check`: CHECK (subtotal >= 0)

**Row Level Security (RLS):**
- ✅ Habilitado
- Políticas:
  - Usuários podem visualizar itens de seus próprios pedidos
  - Admins podem visualizar todos os itens
  - Usuários podem inserir itens em seus próprios pedidos

#### Regras de Negócio
- RN14: Quantidade deve ser maior que zero
- RN15: Preço unitário e subtotal são congelados no momento da compra
- RN16: Subtotal deve ser igual a quantidade × preco_unitario
- RN17: Item sempre pertence a um pedido e referencia um produto

#### Cálculos
- **subtotal** = `quantidade` × `preco_unitario`
- **total do pedido** = Σ(subtotal de todos itens)

#### Observações
- Deleção em cascata: se pedido é deletado, itens também são
- Produto não é deletado em cascata (preserva histórico)
- Preço é armazenado para preservar valor histórico (produto pode mudar de preço)
- Personalização permite observações como "Sem açúcar", "Dobrar chocolate", etc.

---

### 2.5 FAVORITOS

**Descrição:** Relaciona usuários com produtos marcados como favoritos.

**Nome Físico:** `favoritos`

**Chave Primária:** `id`

**Chaves Estrangeiras:**
- `usuario_id` → `usuarios(id)`
- `produto_id` → `produtos(id)`

**Índices:**
- `favoritos_pkey` (PRIMARY KEY) em `id`
- `favoritos_usuario_id_produto_id_key` (UNIQUE) em `(usuario_id, produto_id)`
- `idx_favoritos_usuario` (INDEX) em `usuario_id`
- `idx_favoritos_produto` (INDEX) em `produto_id`

#### Colunas

| Nome | Tipo | Tamanho | Nulo | Padrão | Descrição |
|------|------|---------|------|--------|-----------|
| **id** | UUID | 16 bytes | NÃO | `gen_random_uuid()` | Identificador único do favorito (PK) |
| **usuario_id** | UUID | 16 bytes | NÃO | - | Referência ao usuário (FK) |
| **produto_id** | UUID | 16 bytes | NÃO | - | Referência ao produto favoritado (FK) |
| **criado_em** | TIMESTAMPTZ | 8 bytes | SIM | `now()` | Data e hora em que foi favoritado |

#### Restrições

**Constraints:**
- `favoritos_pkey`: PRIMARY KEY (id)
- `favoritos_usuario_id_fkey`: FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
- `favoritos_produto_id_fkey`: FOREIGN KEY (produto_id) REFERENCES produtos(id) ON DELETE CASCADE
- `favoritos_usuario_id_produto_id_key`: UNIQUE (usuario_id, produto_id)

**Row Level Security (RLS):**
- ✅ Habilitado
- Políticas:
  - Usuários podem visualizar apenas seus próprios favoritos
  - Usuários podem adicionar favoritos
  - Usuários podem remover seus próprios favoritos

#### Regras de Negócio
- RN18: Usuário não pode favoritar o mesmo produto mais de uma vez
- RN19: Apenas usuários autenticados podem favoritar produtos
- RN20: Favorito é removido se produto ou usuário for deletado

#### Observações
- Tabela associativa para relacionamento N:M entre usuarios e produtos
- Constraint UNIQUE garante que não há duplicatas
- Deleção em cascata quando usuário ou produto é removido

---

### 2.6 AVALIACOES

**Descrição:** Armazena avaliações e comentários de usuários sobre produtos.

**Nome Físico:** `avaliacoes`

**Chave Primária:** `id`

**Chaves Estrangeiras:**
- `usuario_id` → `usuarios(id)`
- `produto_id` → `produtos(id)`

**Índices:**
- `avaliacoes_pkey` (PRIMARY KEY) em `id`
- `idx_avaliacoes_produto` (INDEX) em `produto_id`
- `idx_avaliacoes_usuario` (INDEX) em `usuario_id`

#### Colunas

| Nome | Tipo | Tamanho | Nulo | Padrão | Descrição |
|------|------|---------|------|--------|-----------|
| **id** | UUID | 16 bytes | NÃO | `gen_random_uuid()` | Identificador único da avaliação (PK) |
| **usuario_id** | UUID | 16 bytes | NÃO | - | Referência ao usuário avaliador (FK) |
| **produto_id** | UUID | 16 bytes | NÃO | - | Referência ao produto avaliado (FK) |
| **nota** | INTEGER | 4 bytes | NÃO | - | Nota de 1 a 5 estrelas |
| **comentario** | TEXT | Variável | SIM | NULL | Comentário opcional sobre o produto |
| **criado_em** | TIMESTAMPTZ | 8 bytes | SIM | `now()` | Data e hora da avaliação |

#### Restrições

**Constraints:**
- `avaliacoes_pkey`: PRIMARY KEY (id)
- `avaliacoes_usuario_id_fkey`: FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
- `avaliacoes_produto_id_fkey`: FOREIGN KEY (produto_id) REFERENCES produtos(id) ON DELETE CASCADE
- `avaliacoes_nota_check`: CHECK (nota >= 1 AND nota <= 5)

**Row Level Security (RLS):**
- ✅ Habilitado
- Políticas:
  - Todos podem visualizar avaliações
  - Usuários autenticados podem criar avaliações
  - Usuários podem atualizar suas próprias avaliações
  - Usuários podem deletar suas próprias avaliações
  - Admins podem deletar qualquer avaliação

#### Regras de Negócio
- RN21: Nota deve estar entre 1 e 5 (inclusivo)
- RN22: Comentário é opcional
- RN23: Usuário pode avaliar o mesmo produto múltiplas vezes (histórico)
- RN24: Avaliações são públicas (todos podem ver)

#### Valores Permitidos
- **nota:**
  - `1` - Muito ruim
  - `2` - Ruim
  - `3` - Regular
  - `4` - Bom
  - `5` - Excelente

#### Cálculos Derivados
- **Média de avaliações de um produto:**
  ```sql
  SELECT AVG(nota) FROM avaliacoes WHERE produto_id = $1
  ```

#### Observações
- Múltiplas avaliações do mesmo usuário no mesmo produto são permitidas
- Útil para rastrear mudanças de opinião ao longo do tempo
- Deleção em cascata quando usuário ou produto é removido

---

## 3. Relacionamentos entre Tabelas

### 3.1 Diagrama de Relacionamentos

```
USUARIOS (1) ──────── (N) PEDIDOS
    │                       │
    │ (N)                   │ (1)
    │                       │
    │                  ┌────┴────┐
    │                  │         │
    │              ITENS_PEDIDO  │
    │                  │         │
    │                  │ (N)     │
    │                  │         │
    │ (N)              │ (1)     │
    │                  │         │
FAVORITOS            PRODUTOS ◄──┘
    │                  │
    │ (N)              │ (N)
    │                  │
    └──────────────AVALIACOES
```

### 3.2 Detalhamento dos Relacionamentos

#### USUARIOS → PEDIDOS (1:N)
- Um usuário pode fazer vários pedidos
- Um pedido pertence a um único usuário
- **ON DELETE CASCADE:** Deletar usuário remove seus pedidos

#### PEDIDOS → ITENS_PEDIDO (1:N)
- Um pedido contém vários itens
- Um item pertence a um único pedido
- **ON DELETE CASCADE:** Deletar pedido remove seus itens

#### PRODUTOS → ITENS_PEDIDO (1:N)
- Um produto pode estar em vários itens de pedido
- Um item referencia um único produto
- **ON DELETE RESTRICT:** Produto com pedidos não pode ser deletado

#### USUARIOS ↔ PRODUTOS via FAVORITOS (N:M)
- Um usuário pode favoritar vários produtos
- Um produto pode ser favoritado por vários usuários
- **ON DELETE CASCADE:** Deletar usuário ou produto remove favoritos

#### USUARIOS ↔ PRODUTOS via AVALIACOES (N:M)
- Um usuário pode avaliar vários produtos
- Um produto pode ser avaliado por vários usuários
- **ON DELETE CASCADE:** Deletar usuário ou produto remove avaliações

---

## 4. Índices e Performance

### 4.1 Índices Criados

| Tabela | Nome do Índice | Colunas | Tipo | Propósito |
|--------|---------------|---------|------|-----------|
| usuarios | usuarios_pkey | id | PRIMARY KEY | Acesso rápido por ID |
| usuarios | usuarios_email_key | email | UNIQUE | Garantir unicidade, login |
| produtos | produtos_pkey | id | PRIMARY KEY | Acesso rápido por ID |
| produtos | idx_produtos_categoria | categoria | INDEX | Filtrar por categoria |
| produtos | idx_produtos_ativo | ativo | INDEX | Listar produtos ativos |
| pedidos | pedidos_pkey | id | PRIMARY KEY | Acesso rápido por ID |
| pedidos | idx_pedidos_usuario | usuario_id | INDEX | Pedidos de um usuário |
| pedidos | idx_pedidos_status | status | INDEX | Filtrar por status |
| itens_pedido | itens_pedido_pkey | id | PRIMARY KEY | Acesso rápido por ID |
| itens_pedido | idx_itens_pedido_pedido | pedido_id | INDEX | Itens de um pedido |
| itens_pedido | idx_itens_pedido_produto | produto_id | INDEX | Pedidos de um produto |
| favoritos | favoritos_pkey | id | PRIMARY KEY | Acesso rápido por ID |
| favoritos | favoritos_usuario_id_produto_id_key | (usuario_id, produto_id) | UNIQUE | Evitar duplicatas |
| favoritos | idx_favoritos_usuario | usuario_id | INDEX | Favoritos de um usuário |
| favoritos | idx_favoritos_produto | produto_id | INDEX | Quem favoritou um produto |
| avaliacoes | avaliacoes_pkey | id | PRIMARY KEY | Acesso rápido por ID |
| avaliacoes | idx_avaliacoes_produto | produto_id | INDEX | Avaliações de um produto |
| avaliacoes | idx_avaliacoes_usuario | usuario_id | INDEX | Avaliações de um usuário |

### 4.2 Queries Otimizadas pelos Índices

1. **Buscar produtos por categoria:**
   ```sql
   SELECT * FROM produtos WHERE categoria = 'Chocolate' AND ativo = true;
   ```
   → Usa `idx_produtos_categoria` e `idx_produtos_ativo`

2. **Listar pedidos de um usuário:**
   ```sql
   SELECT * FROM pedidos WHERE usuario_id = $1 ORDER BY criado_em DESC;
   ```
   → Usa `idx_pedidos_usuario`

3. **Calcular média de avaliações:**
   ```sql
   SELECT AVG(nota) FROM avaliacoes WHERE produto_id = $1;
   ```
   → Usa `idx_avaliacoes_produto`

---

## 5. Triggers e Automações

### 5.1 Função: atualizar_timestamp()

**Descrição:** Atualiza automaticamente o campo `atualizado_em` quando um registro é modificado.

**Código:**
```sql
CREATE OR REPLACE FUNCTION atualizar_timestamp()
RETURNS TRIGGER AS $$
BEGIN
  NEW.atualizado_em = now();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;
```

**Aplicado em:**
- `usuarios` (BEFORE UPDATE)
- `produtos` (BEFORE UPDATE)
- `pedidos` (BEFORE UPDATE)

**Benefício:** Rastreamento automático de modificações sem intervenção manual.

---

## 6. Segurança - Row Level Security (RLS)

### 6.1 Resumo das Políticas

| Tabela | SELECT | INSERT | UPDATE | DELETE |
|--------|--------|--------|--------|--------|
| **usuarios** | Próprio perfil ou admin | - | Próprio perfil | - |
| **produtos** | Ativos (todos) ou todos (admin) | Admin | Admin | Admin |
| **pedidos** | Próprios ou todos (admin) | Autenticado | Próprio ou admin | - |
| **itens_pedido** | De próprios pedidos ou todos (admin) | Em próprio pedido | - | - |
| **favoritos** | Próprios | Próprio | - | Próprio |
| **avaliacoes** | Todos | Autenticado | Própria | Própria ou admin |

### 6.2 Função de Autenticação

**auth.uid():** Retorna o UUID do usuário autenticado no Supabase Auth

**Uso em políticas:**
```sql
USING (auth.uid() = id)
```

---

## 7. Convenções e Padrões

### 7.1 Nomenclatura

- **Tabelas:** snake_case, plural (ex: `usuarios`, `produtos`)
- **Colunas:** snake_case, singular (ex: `usuario_id`, `criado_em`)
- **Chaves Primárias:** Sempre `id` (UUID)
- **Chaves Estrangeiras:** `<tabela>_id` (ex: `usuario_id`, `pedido_id`)
- **Timestamps:** `_em` (ex: `criado_em`, `atualizado_em`)
- **Booleanos:** Prefixo `eh_` ou `esta_` (ex: `eh_admin`, `ativo`)

### 7.2 Tipos de Dados

- **IDs:** UUID (segurança e distribuição)
- **Strings curtas:** TEXT (sem limite artificial)
- **Monetário:** NUMERIC(10,2) (até 99.999.999,99)
- **Inteiros:** INTEGER (4 bytes)
- **Booleanos:** BOOLEAN (1 byte)
- **Timestamps:** TIMESTAMPTZ (com timezone UTC)

### 7.3 Valores Padrão

- **IDs:** `gen_random_uuid()`
- **Timestamps:** `now()`
- **Booleanos:** `false` ou `true` conforme lógica
- **Numéricos:** `0` quando aplicável

---

## 8. Manutenção e Backup

### 8.1 Estratégias de Backup

**Supabase gerencia automaticamente:**
- Backups diários
- Point-in-time recovery
- Replicação em múltiplas zonas

**Backup manual recomendado:**
```bash
pg_dump -h db.supabase.co -U postgres -d postgres > backup_$(date +%Y%m%d).sql
```

### 8.2 Migração de Dados

**Novas migrações devem:**
1. Usar `IF NOT EXISTS` para segurança
2. Incluir comentários explicativos
3. Preservar dados existentes
4. Testar em ambiente de desenvolvimento primeiro

---

## 9. Glossário

- **UUID:** Universal Unique Identifier (identificador único universal)
- **FK:** Foreign Key (chave estrangeira)
- **PK:** Primary Key (chave primária)
- **RLS:** Row Level Security (segurança em nível de linha)
- **CASCADE:** Deletar registros relacionados automaticamente
- **RESTRICT:** Impedir deleção se há registros relacionados
- **TIMESTAMPTZ:** Timestamp with timezone (carimbo de data/hora com fuso)
- **CHECK:** Constraint de validação de valores
- **UNIQUE:** Constraint de unicidade
- **INDEX:** Estrutura para acelerar consultas

---

**Dicionário de Dados Completo**
**Versão:** 1.0
**Data:** 22/10/2025
**Status:** ✅ Sincronizado com Schema Físico
**Responsável:** Equipe Ed Cupcakes
