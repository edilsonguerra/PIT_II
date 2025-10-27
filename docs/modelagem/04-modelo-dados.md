# Ed Cupcakes - Modelos de Dados

## 1. Modelo Conceitual (MER - Modelo Entidade-Relacionamento)

### 1.1 Entidades

#### USUARIO
Representa clientes e administradores da plataforma
- Atributos: id, nome, email, telefone, endereco, cep, ehAdmin, criadoEm, atualizadoEm
- Identificador: id

#### PRODUTO
Representa os cupcakes disponíveis para venda
- Atributos: id, nome, descricao, preco, imagemUrl, categoria, estoque, ativo, criadoEm, atualizadoEm
- Identificador: id

#### PEDIDO
Representa as compras realizadas pelos usuários
- Atributos: id, usuarioId, status, total, enderecoEntrega, cepEntrega, observacoes, criadoEm, atualizadoEm
- Identificador: id

#### ITEM_PEDIDO
Representa cada produto individual dentro de um pedido
- Atributos: id, pedidoId, produtoId, quantidade, precoUnitario, subtotal, personalizacao
- Identificador: id

#### FAVORITO
Representa a relação entre usuário e produtos favoritos
- Atributos: id, usuarioId, produtoId, criadoEm
- Identificador: id
- Restrição: Unique(usuarioId, produtoId) - Um usuário não pode favoritar o mesmo produto duas vezes

#### AVALIACAO
Representa avaliações e comentários sobre produtos
- Atributos: id, usuarioId, produtoId, nota, comentario, criadoEm
- Identificador: id

### 1.2 Relacionamentos

#### USUARIO realiza PEDIDO (1:N)
- Cardinalidade: Um usuário pode realizar vários pedidos; um pedido pertence a um único usuário
- Participação: Parcial (usuário pode não ter pedidos) | Total (pedido sempre tem usuário)

#### PEDIDO contém ITEM_PEDIDO (1:N)
- Cardinalidade: Um pedido contém vários itens; um item pertence a um único pedido
- Participação: Total | Total (pedido sempre tem itens; item sempre pertence a um pedido)

#### PRODUTO está em ITEM_PEDIDO (1:N)
- Cardinalidade: Um produto pode estar em vários itens de pedido; um item referencia um único produto
- Participação: Parcial (produto pode nunca ser comprado) | Total (item sempre referencia um produto)

#### USUARIO favorita PRODUTO (N:M)
- Cardinalidade: Um usuário pode favoritar vários produtos; um produto pode ser favoritado por vários usuários
- Participação: Parcial | Parcial
- Entidade Associativa: FAVORITO

#### USUARIO avalia PRODUTO (N:M)
- Cardinalidade: Um usuário pode avaliar vários produtos; um produto pode ser avaliado por vários usuários
- Participação: Parcial | Parcial
- Entidade Associativa: AVALIACAO

### 1.3 Diagrama Conceitual (Representação Textual)

```
┌───────────┐
│  USUARIO  │
└─────┬─────┘
      │
      │ 1
      │ realiza
      │ N
      ▼
┌───────────┐
│   PEDIDO  │
└─────┬─────┘
      │
      │ 1
      │ contém
      │ N
      ▼
┌────────────┐         N         ┌───────────┐
│ ITEM_PEDIDO│◄─────referencia──┤  PRODUTO  │
└────────────┘         1         └─────┬─────┘
                                       │
                         ┌─────────────┼─────────────┐
                         │             │             │
                         │ N           │ N           │
                         │             │             │
                    ┌────▼───┐    ┌────▼────┐       │
                    │FAVORITO│    │AVALIACAO│       │
                    └────┬───┘    └────┬────┘       │
                         │             │             │
                         │ N           │ N           │
                         │             │             │
                         └─────────────┴─────────────┘
                                      │
                                      │ 1
                                      ▼
                                ┌───────────┐
                                │  USUARIO  │
                                └───────────┘
```

---

## 2. Modelo Lógico (Relacional)

### 2.1 Esquema Relacional

#### USUARIOS
```
USUARIOS (
  id: UUID [PK],
  nome: VARCHAR(100) [NOT NULL],
  email: VARCHAR(100) [NOT NULL, UNIQUE],
  telefone: VARCHAR(20),
  endereco: TEXT,
  cep: VARCHAR(9),
  eh_admin: BOOLEAN [DEFAULT false],
  criado_em: TIMESTAMP [DEFAULT NOW()],
  atualizado_em: TIMESTAMP [DEFAULT NOW()]
)
```

**Restrições:**
- PK: id
- UNIQUE: email
- CHECK: email deve conter '@'

#### PRODUTOS
```
PRODUTOS (
  id: UUID [PK],
  nome: VARCHAR(100) [NOT NULL],
  descricao: TEXT [NOT NULL],
  preco: NUMERIC(10,2) [NOT NULL, CHECK >= 0],
  imagem_url: TEXT,
  categoria: VARCHAR(50) [NOT NULL],
  estoque: INTEGER [DEFAULT 0, CHECK >= 0],
  ativo: BOOLEAN [DEFAULT true],
  criado_em: TIMESTAMP [DEFAULT NOW()],
  atualizado_em: TIMESTAMP [DEFAULT NOW()]
)
```

**Restrições:**
- PK: id
- CHECK: preco >= 0
- CHECK: estoque >= 0

#### PEDIDOS
```
PEDIDOS (
  id: UUID [PK],
  usuario_id: UUID [FK -> USUARIOS.id, NOT NULL],
  status: VARCHAR(50) [DEFAULT 'pendente', CHECK IN (...)],
  total: NUMERIC(10,2) [NOT NULL, CHECK >= 0],
  endereco_entrega: TEXT [NOT NULL],
  cep_entrega: VARCHAR(9) [NOT NULL],
  observacoes: TEXT,
  criado_em: TIMESTAMP [DEFAULT NOW()],
  atualizado_em: TIMESTAMP [DEFAULT NOW()]
)
```

**Restrições:**
- PK: id
- FK: usuario_id REFERENCES USUARIOS(id) ON DELETE CASCADE
- CHECK: status IN ('pendente', 'confirmado', 'preparando', 'enviado', 'entregue', 'cancelado')
- CHECK: total >= 0

#### ITENS_PEDIDO
```
ITENS_PEDIDO (
  id: UUID [PK],
  pedido_id: UUID [FK -> PEDIDOS.id, NOT NULL],
  produto_id: UUID [FK -> PRODUTOS.id, NOT NULL],
  quantidade: INTEGER [NOT NULL, CHECK > 0],
  preco_unitario: NUMERIC(10,2) [NOT NULL, CHECK >= 0],
  subtotal: NUMERIC(10,2) [NOT NULL, CHECK >= 0],
  personalizacao: TEXT
)
```

**Restrições:**
- PK: id
- FK: pedido_id REFERENCES PEDIDOS(id) ON DELETE CASCADE
- FK: produto_id REFERENCES PRODUTOS(id)
- CHECK: quantidade > 0
- CHECK: preco_unitario >= 0
- CHECK: subtotal >= 0

#### FAVORITOS
```
FAVORITOS (
  id: UUID [PK],
  usuario_id: UUID [FK -> USUARIOS.id, NOT NULL],
  produto_id: UUID [FK -> PRODUTOS.id, NOT NULL],
  criado_em: TIMESTAMP [DEFAULT NOW()],
  UNIQUE(usuario_id, produto_id)
)
```

**Restrições:**
- PK: id
- FK: usuario_id REFERENCES USUARIOS(id) ON DELETE CASCADE
- FK: produto_id REFERENCES PRODUTOS(id) ON DELETE CASCADE
- UNIQUE: (usuario_id, produto_id)

#### AVALIACOES
```
AVALIACOES (
  id: UUID [PK],
  usuario_id: UUID [FK -> USUARIOS.id, NOT NULL],
  produto_id: UUID [FK -> PRODUTOS.id, NOT NULL],
  nota: INTEGER [NOT NULL, CHECK BETWEEN 1 AND 5],
  comentario: TEXT,
  criado_em: TIMESTAMP [DEFAULT NOW()]
)
```

**Restrições:**
- PK: id
- FK: usuario_id REFERENCES USUARIOS(id) ON DELETE CASCADE
- FK: produto_id REFERENCES PRODUTOS(id) ON DELETE CASCADE
- CHECK: nota >= 1 AND nota <= 5

### 2.2 Normalização

#### Primeira Forma Normal (1FN)
✅ Todas as tabelas estão na 1FN:
- Todos os atributos são atômicos (sem valores multivalorados)
- Cada coluna contém apenas um valor
- Não há grupos repetitivos

#### Segunda Forma Normal (2FN)
✅ Todas as tabelas estão na 2FN:
- Estão na 1FN
- Todos os atributos não-chave dependem completamente da chave primária
- Não há dependências parciais (todas as PKs são simples, UUID)

#### Terceira Forma Normal (3FN)
✅ Todas as tabelas estão na 3FN:
- Estão na 2FN
- Não há dependências transitivas
- Todos os atributos não-chave dependem apenas da chave primária

**Exceção planejada:**
- `ITENS_PEDIDO.subtotal` é calculado (quantidade × preco_unitario), mas é armazenado por motivos de:
  - Performance (evitar cálculo a cada consulta)
  - Histórico (preço pode mudar, mas subtotal do pedido é fixo)
  - Integridade transacional

#### Forma Normal de Boyce-Codd (FNBC)
✅ Todas as tabelas estão na FNBC:
- Estão na 3FN
- Toda dependência funcional tem uma superchave como determinante

### 2.3 Índices

```sql
-- Índices para otimização de consultas

-- PRODUTOS
CREATE INDEX idx_produtos_categoria ON produtos(categoria);
CREATE INDEX idx_produtos_ativo ON produtos(ativo);

-- PEDIDOS
CREATE INDEX idx_pedidos_usuario ON pedidos(usuario_id);
CREATE INDEX idx_pedidos_status ON pedidos(status);

-- ITENS_PEDIDO
CREATE INDEX idx_itens_pedido_pedido ON itens_pedido(pedido_id);
CREATE INDEX idx_itens_pedido_produto ON itens_pedido(produto_id);

-- FAVORITOS
CREATE INDEX idx_favoritos_usuario ON favoritos(usuario_id);
CREATE INDEX idx_favoritos_produto ON favoritos(produto_id);

-- AVALIACOES
CREATE INDEX idx_avaliacoes_produto ON avaliacoes(produto_id);
CREATE INDEX idx_avaliacoes_usuario ON avaliacoes(usuario_id);
```

---

## 3. Dependências Funcionais

### USUARIOS
- id → nome, email, telefone, endereco, cep, eh_admin, criado_em, atualizado_em
- email → id (unique)

### PRODUTOS
- id → nome, descricao, preco, imagem_url, categoria, estoque, ativo, criado_em, atualizado_em

### PEDIDOS
- id → usuario_id, status, total, endereco_entrega, cep_entrega, observacoes, criado_em, atualizado_em

### ITENS_PEDIDO
- id → pedido_id, produto_id, quantidade, preco_unitario, subtotal, personalizacao

### FAVORITOS
- id → usuario_id, produto_id, criado_em
- (usuario_id, produto_id) → id (unique)

### AVALIACOES
- id → usuario_id, produto_id, nota, comentario, criado_em

---

## 4. Integridade Referencial

### Regras de Deleção

#### CASCADE (Deleção em Cascata)
Quando a entidade pai é deletada, as entidades filhas também são deletadas:

1. **USUARIOS → PEDIDOS**
   - Se um usuário for deletado, todos os seus pedidos são deletados
   - Justificativa: Pedidos sem usuário não fazem sentido (dados órfãos)

2. **PEDIDOS → ITENS_PEDIDO**
   - Se um pedido for deletado, todos os itens do pedido são deletados
   - Justificativa: Itens sem pedido não fazem sentido

3. **USUARIOS → FAVORITOS**
   - Se um usuário for deletado, todos os seus favoritos são deletados
   - Justificativa: Favoritos sem usuário não fazem sentido

4. **PRODUTOS → FAVORITOS**
   - Se um produto for deletado, todas as relações de favoritos são deletadas
   - Justificativa: Favorito de produto inexistente não faz sentido

5. **USUARIOS → AVALIACOES**
   - Se um usuário for deletado, todas as suas avaliações são deletadas
   - Justificativa: Avaliações sem autor não fazem sentido

6. **PRODUTOS → AVALIACOES**
   - Se um produto for deletado, todas as suas avaliações são deletadas
   - Justificativa: Avaliações de produto inexistente não fazem sentido

#### NO ACTION / RESTRICT
Quando há dependências, não permite deleção:

1. **PRODUTOS → ITENS_PEDIDO**
   - Se um produto está em algum pedido, não pode ser deletado diretamente
   - Solução: Marcar produto como `ativo = false` (soft delete)
   - Justificativa: Preservar histórico de pedidos

### Regras de Atualização

- **PK (UUID):** Imutáveis - nunca devem ser atualizadas
- **FK:** Atualização não permitida (NO ACTION)
- **Atributos comuns:** Atualização livre com validações

---

## 5. Diagrama Lógico (Representação Visual)

```
┌─────────────────────────────────────┐
│           USUARIOS                  │
├─────────────────────────────────────┤
│ PK  id: UUID                        │
│     nome: VARCHAR(100)              │
│ UK  email: VARCHAR(100)             │
│     telefone: VARCHAR(20)           │
│     endereco: TEXT                  │
│     cep: VARCHAR(9)                 │
│     eh_admin: BOOLEAN               │
│     criado_em: TIMESTAMP            │
│     atualizado_em: TIMESTAMP        │
└──────────┬──────────────────────────┘
           │
           │ 1:N
           ▼
┌─────────────────────────────────────┐
│           PEDIDOS                   │
├─────────────────────────────────────┤
│ PK  id: UUID                        │
│ FK  usuario_id: UUID                │
│     status: VARCHAR(50)             │
│     total: NUMERIC(10,2)            │
│     endereco_entrega: TEXT          │
│     cep_entrega: VARCHAR(9)         │
│     observacoes: TEXT               │
│     criado_em: TIMESTAMP            │
│     atualizado_em: TIMESTAMP        │
└──────────┬──────────────────────────┘
           │
           │ 1:N
           ▼
┌─────────────────────────────────────┐       1:N      ┌─────────────────────────────────────┐
│        ITENS_PEDIDO                 │◄────────────────┤          PRODUTOS                   │
├─────────────────────────────────────┤                 ├─────────────────────────────────────┤
│ PK  id: UUID                        │                 │ PK  id: UUID                        │
│ FK  pedido_id: UUID                 │                 │     nome: VARCHAR(100)              │
│ FK  produto_id: UUID                │                 │     descricao: TEXT                 │
│     quantidade: INTEGER             │                 │     preco: NUMERIC(10,2)            │
│     preco_unitario: NUMERIC(10,2)   │                 │     imagem_url: TEXT                │
│     subtotal: NUMERIC(10,2)         │                 │     categoria: VARCHAR(50)          │
│     personalizacao: TEXT            │                 │     estoque: INTEGER                │
└─────────────────────────────────────┘                 │     ativo: BOOLEAN                  │
                                                        │     criado_em: TIMESTAMP            │
                                                        │     atualizado_em: TIMESTAMP        │
                                                        └──────────┬──────────────────────────┘
                                                                   │
                                                   ┌───────────────┴───────────────┐
                                                   │ N:M                       N:M │
                                                   ▼                               ▼
                                        ┌──────────────────────┐      ┌──────────────────────┐
                                        │      FAVORITOS       │      │     AVALIACOES       │
                                        ├──────────────────────┤      ├──────────────────────┤
                                        │ PK  id: UUID         │      │ PK  id: UUID         │
                                        │ FK  usuario_id: UUID │      │ FK  usuario_id: UUID │
                                        │ FK  produto_id: UUID │      │ FK  produto_id: UUID │
                                        │     criado_em: TS    │      │     nota: INTEGER    │
                                        │ UK (usuario,produto) │      │     comentario: TEXT │
                                        └──────────────────────┘      │     criado_em: TS    │
                                                                      └──────────────────────┘
```

---

## 6. Considerações de Design

### 6.1 Escolha de UUID como Chave Primária

**Vantagens:**
- Segurança: Não expõe contagem de registros
- Distribuição: Permite geração em múltiplos servidores sem colisão
- Privacidade: IDs não sequenciais dificultam enumeração
- Escalabilidade: Facilita merge de bancos e replicação

**Desvantagens (mitigadas):**
- Tamanho: 16 bytes vs 4 bytes (int) - mitigado por UUIDv4 otimizado
- Performance: Impacto mínimo com índices adequados
- Legibilidade: Compensado por segurança

### 6.2 Soft Delete vs Hard Delete

**PRODUTOS:**
- Usa soft delete (campo `ativo`)
- Produtos inativos não aparecem no catálogo
- Preserva histórico de pedidos com produtos descontinuados

**USUARIOS, PEDIDOS:**
- Hard delete com CASCADE
- Deleta dados relacionados (GDPR/LGPD compliance se necessário)
- Alternativa: Implementar soft delete se histórico for crítico

### 6.3 Desnormalização Controlada

**subtotal em ITENS_PEDIDO:**
- Armazena `quantidade × preco_unitario`
- Vantagens:
  - Performance em consultas de pedidos
  - Histórico preservado (preço pode mudar)
  - Simplifica relatórios e agregações
- Manutenção: Calculado automaticamente no insert/update

**total em PEDIDOS:**
- Armazena soma de todos subtotais
- Mesmas vantagens do subtotal
- Facilita ordenação e filtragem por valor

### 6.4 Timestamps e Auditoria

Todas as tabelas principais possuem:
- `criado_em`: Momento de criação (imutável)
- `atualizado_em`: Última modificação (atualizado automaticamente via trigger)

Benefícios:
- Rastreabilidade de mudanças
- Debugging facilitado
- Possibilita implementação futura de versionamento

### 6.5 Estratégia de Estoque

**Campo `estoque` em PRODUTOS:**
- Controle simples de quantidade disponível
- Atualizado a cada venda
- CHECK constraint garante não negatividade

**Evolução Futura:**
- Implementar reserva temporária durante checkout
- Tabela de movimentações de estoque
- Alertas de estoque baixo

---

## 7. Regras de Negócio Implementadas no Modelo

### RN01: Unicidade de E-mail
- Implementada via UNIQUE constraint em `usuarios.email`

### RN02: Preços Não Negativos
- Implementada via CHECK constraint em `produtos.preco >= 0`

### RN03: Estoque Não Negativo
- Implementada via CHECK constraint em `produtos.estoque >= 0`

### RN04: Quantidade Mínima em Pedido
- Implementada via CHECK constraint em `itens_pedido.quantidade > 0`

### RN05: Notas entre 1 e 5
- Implementada via CHECK constraint em `avaliacoes.nota >= 1 AND nota <= 5`

### RN06: Status de Pedido Controlado
- Implementada via CHECK constraint com enum de valores permitidos

### RN07: Favorito Único por Usuário
- Implementada via UNIQUE constraint em `(usuario_id, produto_id)`

### RN08: Pedido Sempre tem Usuário
- Implementada via NOT NULL em `pedidos.usuario_id` + FK

### RN09: Item Sempre Referencia Produto e Pedido
- Implementada via NOT NULL nas FKs de `itens_pedido`

### RN10: Endereço Obrigatório no Pedido
- Implementada via NOT NULL em `pedidos.endereco_entrega` e `cep_entrega`

---

## 8. Consultas SQL Importantes

### 8.1 Produtos Mais Vendidos

```sql
SELECT
  p.id,
  p.nome,
  COUNT(ip.id) AS quantidade_vendida,
  SUM(ip.subtotal) AS receita_total
FROM produtos p
LEFT JOIN itens_pedido ip ON p.id = ip.produto_id
LEFT JOIN pedidos ped ON ip.pedido_id = ped.id
WHERE ped.status != 'cancelado'
GROUP BY p.id, p.nome
ORDER BY quantidade_vendida DESC
LIMIT 10;
```

### 8.2 Avaliação Média por Produto

```sql
SELECT
  p.id,
  p.nome,
  AVG(a.nota) AS nota_media,
  COUNT(a.id) AS total_avaliacoes
FROM produtos p
LEFT JOIN avaliacoes a ON p.id = a.produto_id
GROUP BY p.id, p.nome
ORDER BY nota_media DESC;
```

### 8.3 Pedidos com Itens (JOIN completo)

```sql
SELECT
  ped.id AS pedido_id,
  ped.criado_em,
  ped.status,
  u.nome AS cliente,
  u.email,
  p.nome AS produto,
  ip.quantidade,
  ip.preco_unitario,
  ip.subtotal
FROM pedidos ped
JOIN usuarios u ON ped.usuario_id = u.id
JOIN itens_pedido ip ON ped.id = ip.pedido_id
JOIN produtos p ON ip.produto_id = p.id
WHERE ped.id = $1;
```

### 8.4 Produtos Favoritos de um Usuário

```sql
SELECT
  p.*,
  f.criado_em AS favoritado_em
FROM favoritos f
JOIN produtos p ON f.produto_id = p.id
WHERE f.usuario_id = $1 AND p.ativo = true
ORDER BY f.criado_em DESC;
```

### 8.5 Receita Total por Período

```sql
SELECT
  DATE(criado_em) AS data,
  COUNT(*) AS total_pedidos,
  SUM(total) AS receita_dia
FROM pedidos
WHERE status = 'entregue'
  AND criado_em >= $1
  AND criado_em <= $2
GROUP BY DATE(criado_em)
ORDER BY data DESC;
```

---

## 9. Evolução Futura do Modelo

### Possíveis Extensões

#### Tabela CATEGORIAS
```sql
CREATE TABLE categorias (
  id UUID PRIMARY KEY,
  nome VARCHAR(50) UNIQUE NOT NULL,
  descricao TEXT,
  imagem_url TEXT
);
```
- Normalizar categorias de produtos
- Permitir adicionar/remover categorias dinamicamente

#### Tabela CUPONS_DESCONTO
```sql
CREATE TABLE cupons (
  id UUID PRIMARY KEY,
  codigo VARCHAR(20) UNIQUE NOT NULL,
  desconto_percentual NUMERIC(5,2),
  desconto_fixo NUMERIC(10,2),
  valido_ate TIMESTAMP,
  ativo BOOLEAN DEFAULT true
);
```
- Implementar sistema de promoções

#### Tabela ENDERECOS
```sql
CREATE TABLE enderecos (
  id UUID PRIMARY KEY,
  usuario_id UUID REFERENCES usuarios(id),
  apelido VARCHAR(50), -- Casa, Trabalho, etc
  rua TEXT NOT NULL,
  numero VARCHAR(10),
  complemento TEXT,
  bairro VARCHAR(100),
  cidade VARCHAR(100),
  estado VARCHAR(2),
  cep VARCHAR(9) NOT NULL,
  principal BOOLEAN DEFAULT false
);
```
- Múltiplos endereços por usuário
- Acelerar checkout

#### Tabela PAGAMENTOS
```sql
CREATE TABLE pagamentos (
  id UUID PRIMARY KEY,
  pedido_id UUID REFERENCES pedidos(id),
  metodo VARCHAR(50), -- PIX, Cartão, Dinheiro
  status VARCHAR(50), -- Pendente, Aprovado, Recusado
  valor NUMERIC(10,2),
  processado_em TIMESTAMP
);
```
- Controle de pagamentos
- Integração futura com gateways

---

## 10. Diagrama Entidade-Relacionamento (ER) Estendido

### Notação:

- **Entidade Forte:** Retângulo
- **Entidade Fraca:** Retângulo duplo
- **Atributo:** Elipse
- **Atributo Chave:** Elipse sublinhada
- **Relacionamento:** Losango
- **Cardinalidade:** 1:1, 1:N, N:M

### Representação Textual Completa:

```
           ┌─────────┐
           │  nome   │
           └────┬────┘
           ┌────┴────┐
           │  email  │ (UK)
           └────┬────┘
           ┌────┴────┐
┌──────┐   │    id   │ (PK)   ┌──────────┐
│admin?│───┤         │────────┤ telefone │
└──────┘   │ USUARIO │        └──────────┘
           └────┬────┘
                │
         ┌──────┴──────┐
         │   realiza   │ (1:N)
         └──────┬──────┘
                │
           ┌────┴────┐
           │   id    │ (PK)
           └────┬────┘
           ┌────┴────┐
           │ status  │
           └────┬────┘
           ┌────┴────┐
           │ PEDIDO  │
           └────┬────┘
                │
         ┌──────┴──────┐
         │   contém    │ (1:N)
         └──────┬──────┘
                │
           ┌────┴────────┐
           │     id      │ (PK)
           └────┬────────┘
           ┌────┴────────┐
           │ quantidade  │
           └────┬────────┘
           ┌────┴────────┐
           │ITEM_PEDIDO  │
           └────┬────────┘
                │
         ┌──────┴──────┐
         │ referencia  │ (N:1)
         └──────┬──────┘
                │
           ┌────┴────┐
           │   id    │ (PK)
           └────┬────┘
           ┌────┴────┐
           │  nome   │
           └────┬────┘
           ┌────┴────┐
           │  preco  │
           └────┬────┘
           ┌────┴────┐
           │ PRODUTO │
           └────┬────┘
                │
       ┌────────┴────────┐
       │                 │
┌──────┴──────┐   ┌──────┴──────┐
│  favorita   │   │   avalia    │
│    (N:M)    │   │    (N:M)    │
└──────┬──────┘   └──────┬──────┘
       │                 │
 ┌─────┴─────┐     ┌─────┴─────┐
 │ FAVORITO  │     │ AVALIACAO │
 │ (id, dt)  │     │(id,nota)  │
 └───────────┘     └───────────┘
```

---

**Modelo de Dados Completo e Normalizado**
**Versão:** 1.0
**Data:** 22/10/2025
**Status:** ✅ Implementado no Supabase
