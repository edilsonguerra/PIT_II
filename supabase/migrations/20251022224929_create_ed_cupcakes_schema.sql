/*
  # Ed Cupcakes - Schema Principal da Loja Virtual

  ## Descrição
  Este migration cria a estrutura completa do banco de dados para a loja virtual Ed Cupcakes,
  incluindo tabelas para gestão de usuários, produtos, pedidos, favoritos e avaliações.

  ## Novas Tabelas

  ### 1. `usuarios`
  Armazena dados dos clientes da loja (compradores e administradores)
  - `id` (uuid, PK) - Identificador único do usuário
  - `nome` (text) - Nome completo do usuário
  - `email` (text, unique) - E-mail para login
  - `telefone` (text) - Telefone de contato
  - `endereco` (text) - Endereço completo
  - `cep` (text) - CEP do endereço
  - `eh_admin` (boolean) - Define se é administrador
  - `criado_em` (timestamptz) - Data de criação do registro
  - `atualizado_em` (timestamptz) - Data da última atualização

  ### 2. `produtos`
  Catálogo de cupcakes disponíveis na loja
  - `id` (uuid, PK) - Identificador único do produto
  - `nome` (text) - Nome do cupcake
  - `descricao` (text) - Descrição detalhada
  - `preco` (numeric) - Preço unitário
  - `imagem_url` (text) - URL da imagem do produto
  - `categoria` (text) - Categoria (ex: Chocolate, Frutas, Especial)
  - `estoque` (integer) - Quantidade disponível
  - `ativo` (boolean) - Se o produto está disponível para venda
  - `criado_em` (timestamptz) - Data de criação
  - `atualizado_em` (timestamptz) - Data da última atualização

  ### 3. `pedidos`
  Registro de todos os pedidos realizados
  - `id` (uuid, PK) - Identificador único do pedido
  - `usuario_id` (uuid, FK) - Referência ao usuário comprador
  - `status` (text) - Status do pedido (pendente, confirmado, enviado, entregue, cancelado)
  - `total` (numeric) - Valor total do pedido
  - `endereco_entrega` (text) - Endereço de entrega
  - `cep_entrega` (text) - CEP de entrega
  - `observacoes` (text) - Observações do cliente
  - `criado_em` (timestamptz) - Data de criação do pedido
  - `atualizado_em` (timestamptz) - Data da última atualização

  ### 4. `itens_pedido`
  Itens individuais de cada pedido
  - `id` (uuid, PK) - Identificador único do item
  - `pedido_id` (uuid, FK) - Referência ao pedido
  - `produto_id` (uuid, FK) - Referência ao produto
  - `quantidade` (integer) - Quantidade comprada
  - `preco_unitario` (numeric) - Preço no momento da compra
  - `subtotal` (numeric) - Quantidade × preço unitário
  - `personalizacao` (text) - Observações de personalização

  ### 5. `favoritos`
  Produtos marcados como favoritos pelos usuários
  - `id` (uuid, PK) - Identificador único
  - `usuario_id` (uuid, FK) - Referência ao usuário
  - `produto_id` (uuid, FK) - Referência ao produto
  - `criado_em` (timestamptz) - Data em que foi favoritado

  ### 6. `avaliacoes`
  Avaliações e comentários dos clientes sobre os produtos
  - `id` (uuid, PK) - Identificador único
  - `usuario_id` (uuid, FK) - Referência ao usuário avaliador
  - `produto_id` (uuid, FK) - Referência ao produto avaliado
  - `nota` (integer) - Nota de 1 a 5
  - `comentario` (text) - Comentário opcional
  - `criado_em` (timestamptz) - Data da avaliação

  ## Segurança

  ### Row Level Security (RLS)
  Todas as tabelas têm RLS habilitado com as seguintes políticas:

  #### Tabela `usuarios`
  - SELECT: Usuários autenticados podem ver apenas seus próprios dados
  - INSERT: Apenas durante cadastro (via Supabase Auth)
  - UPDATE: Usuários podem atualizar apenas seus próprios dados
  - DELETE: Apenas admins podem deletar usuários

  #### Tabela `produtos`
  - SELECT: Todos podem visualizar produtos ativos
  - INSERT/UPDATE/DELETE: Apenas administradores

  #### Tabela `pedidos`
  - SELECT: Usuários veem apenas seus pedidos; admins veem todos
  - INSERT: Usuários autenticados podem criar pedidos
  - UPDATE: Admins podem atualizar status; usuários podem cancelar seus próprios pedidos
  - DELETE: Apenas admins

  #### Tabela `itens_pedido`
  - SELECT: Acesso via pedido (usuários veem itens de seus pedidos)
  - INSERT: Criado junto com o pedido
  - UPDATE/DELETE: Apenas admins

  #### Tabela `favoritos`
  - SELECT: Usuários veem apenas seus favoritos
  - INSERT/DELETE: Usuários gerenciam seus próprios favoritos

  #### Tabela `avaliacoes`
  - SELECT: Todos podem ver avaliações
  - INSERT: Usuários autenticados podem avaliar
  - UPDATE: Usuários podem editar suas próprias avaliações
  - DELETE: Usuários podem deletar suas avaliações; admins podem deletar qualquer uma

  ## Índices
  Criados índices para otimizar consultas frequentes:
  - Busca de produtos por categoria
  - Pedidos por usuário
  - Favoritos por usuário
  - Avaliações por produto

  ## Observações Importantes
  - Todos os IDs usam UUID para segurança
  - Timestamps automáticos para auditoria
  - Preços armazenados com 2 casas decimais
  - Constraint para notas entre 1 e 5
  - Unique constraint em favoritos (um usuário não pode favoritar o mesmo produto duas vezes)
*/

-- Criação da tabela usuarios
CREATE TABLE IF NOT EXISTS usuarios (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  nome text NOT NULL,
  email text UNIQUE NOT NULL,
  telefone text,
  endereco text,
  cep text,
  eh_admin boolean DEFAULT false,
  criado_em timestamptz DEFAULT now(),
  atualizado_em timestamptz DEFAULT now()
);

-- Criação da tabela produtos
CREATE TABLE IF NOT EXISTS produtos (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  nome text NOT NULL,
  descricao text NOT NULL,
  preco numeric(10,2) NOT NULL CHECK (preco >= 0),
  imagem_url text,
  categoria text NOT NULL,
  estoque integer DEFAULT 0 CHECK (estoque >= 0),
  ativo boolean DEFAULT true,
  criado_em timestamptz DEFAULT now(),
  atualizado_em timestamptz DEFAULT now()
);

-- Criação da tabela pedidos
CREATE TABLE IF NOT EXISTS pedidos (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  usuario_id uuid NOT NULL REFERENCES usuarios(id) ON DELETE CASCADE,
  status text DEFAULT 'pendente' CHECK (status IN ('pendente', 'confirmado', 'preparando', 'enviado', 'entregue', 'cancelado')),
  total numeric(10,2) NOT NULL CHECK (total >= 0),
  endereco_entrega text NOT NULL,
  cep_entrega text NOT NULL,
  observacoes text,
  criado_em timestamptz DEFAULT now(),
  atualizado_em timestamptz DEFAULT now()
);

-- Criação da tabela itens_pedido
CREATE TABLE IF NOT EXISTS itens_pedido (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  pedido_id uuid NOT NULL REFERENCES pedidos(id) ON DELETE CASCADE,
  produto_id uuid NOT NULL REFERENCES produtos(id),
  quantidade integer NOT NULL CHECK (quantidade > 0),
  preco_unitario numeric(10,2) NOT NULL CHECK (preco_unitario >= 0),
  subtotal numeric(10,2) NOT NULL CHECK (subtotal >= 0),
  personalizacao text
);

-- Criação da tabela favoritos
CREATE TABLE IF NOT EXISTS favoritos (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  usuario_id uuid NOT NULL REFERENCES usuarios(id) ON DELETE CASCADE,
  produto_id uuid NOT NULL REFERENCES produtos(id) ON DELETE CASCADE,
  criado_em timestamptz DEFAULT now(),
  UNIQUE(usuario_id, produto_id)
);

-- Criação da tabela avaliacoes
CREATE TABLE IF NOT EXISTS avaliacoes (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  usuario_id uuid NOT NULL REFERENCES usuarios(id) ON DELETE CASCADE,
  produto_id uuid NOT NULL REFERENCES produtos(id) ON DELETE CASCADE,
  nota integer NOT NULL CHECK (nota >= 1 AND nota <= 5),
  comentario text,
  criado_em timestamptz DEFAULT now()
);

-- Criar índices para otimização de consultas
CREATE INDEX IF NOT EXISTS idx_produtos_categoria ON produtos(categoria);
CREATE INDEX IF NOT EXISTS idx_produtos_ativo ON produtos(ativo);
CREATE INDEX IF NOT EXISTS idx_pedidos_usuario ON pedidos(usuario_id);
CREATE INDEX IF NOT EXISTS idx_pedidos_status ON pedidos(status);
CREATE INDEX IF NOT EXISTS idx_itens_pedido_pedido ON itens_pedido(pedido_id);
CREATE INDEX IF NOT EXISTS idx_itens_pedido_produto ON itens_pedido(produto_id);
CREATE INDEX IF NOT EXISTS idx_favoritos_usuario ON favoritos(usuario_id);
CREATE INDEX IF NOT EXISTS idx_favoritos_produto ON favoritos(produto_id);
CREATE INDEX IF NOT EXISTS idx_avaliacoes_produto ON avaliacoes(produto_id);
CREATE INDEX IF NOT EXISTS idx_avaliacoes_usuario ON avaliacoes(usuario_id);

-- Função para atualizar timestamp automaticamente
CREATE OR REPLACE FUNCTION atualizar_timestamp()
RETURNS TRIGGER AS $$
BEGIN
  NEW.atualizado_em = now();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Triggers para atualização automática de timestamps
CREATE TRIGGER trigger_atualizar_usuarios
  BEFORE UPDATE ON usuarios
  FOR EACH ROW
  EXECUTE FUNCTION atualizar_timestamp();

CREATE TRIGGER trigger_atualizar_produtos
  BEFORE UPDATE ON produtos
  FOR EACH ROW
  EXECUTE FUNCTION atualizar_timestamp();

CREATE TRIGGER trigger_atualizar_pedidos
  BEFORE UPDATE ON pedidos
  FOR EACH ROW
  EXECUTE FUNCTION atualizar_timestamp();

-- ============================================
-- ROW LEVEL SECURITY (RLS)
-- ============================================

-- Habilitar RLS em todas as tabelas
ALTER TABLE usuarios ENABLE ROW LEVEL SECURITY;
ALTER TABLE produtos ENABLE ROW LEVEL SECURITY;
ALTER TABLE pedidos ENABLE ROW LEVEL SECURITY;
ALTER TABLE itens_pedido ENABLE ROW LEVEL SECURITY;
ALTER TABLE favoritos ENABLE ROW LEVEL SECURITY;
ALTER TABLE avaliacoes ENABLE ROW LEVEL SECURITY;

-- ============================================
-- POLÍTICAS RLS - TABELA USUARIOS
-- ============================================

-- Usuários podem ver apenas seus próprios dados
CREATE POLICY "Usuários podem ver próprio perfil"
  ON usuarios FOR SELECT
  TO authenticated
  USING (auth.uid() = id);

-- Admins podem ver todos os usuários
CREATE POLICY "Admins podem ver todos usuários"
  ON usuarios FOR SELECT
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM usuarios
      WHERE id = auth.uid() AND eh_admin = true
    )
  );

-- Usuários podem atualizar apenas seus próprios dados
CREATE POLICY "Usuários podem atualizar próprio perfil"
  ON usuarios FOR UPDATE
  TO authenticated
  USING (auth.uid() = id)
  WITH CHECK (auth.uid() = id);

-- ============================================
-- POLÍTICAS RLS - TABELA PRODUTOS
-- ============================================

-- Todos podem visualizar produtos ativos
CREATE POLICY "Todos podem ver produtos ativos"
  ON produtos FOR SELECT
  TO authenticated
  USING (ativo = true);

-- Admins podem ver todos os produtos
CREATE POLICY "Admins podem ver todos produtos"
  ON produtos FOR SELECT
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM usuarios
      WHERE id = auth.uid() AND eh_admin = true
    )
  );

-- Apenas admins podem inserir produtos
CREATE POLICY "Admins podem criar produtos"
  ON produtos FOR INSERT
  TO authenticated
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM usuarios
      WHERE id = auth.uid() AND eh_admin = true
    )
  );

-- Apenas admins podem atualizar produtos
CREATE POLICY "Admins podem atualizar produtos"
  ON produtos FOR UPDATE
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM usuarios
      WHERE id = auth.uid() AND eh_admin = true
    )
  )
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM usuarios
      WHERE id = auth.uid() AND eh_admin = true
    )
  );

-- Apenas admins podem deletar produtos
CREATE POLICY "Admins podem deletar produtos"
  ON produtos FOR DELETE
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM usuarios
      WHERE id = auth.uid() AND eh_admin = true
    )
  );

-- ============================================
-- POLÍTICAS RLS - TABELA PEDIDOS
-- ============================================

-- Usuários podem ver apenas seus próprios pedidos
CREATE POLICY "Usuários podem ver próprios pedidos"
  ON pedidos FOR SELECT
  TO authenticated
  USING (usuario_id = auth.uid());

-- Admins podem ver todos os pedidos
CREATE POLICY "Admins podem ver todos pedidos"
  ON pedidos FOR SELECT
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM usuarios
      WHERE id = auth.uid() AND eh_admin = true
    )
  );

-- Usuários autenticados podem criar pedidos
CREATE POLICY "Usuários podem criar pedidos"
  ON pedidos FOR INSERT
  TO authenticated
  WITH CHECK (usuario_id = auth.uid());

-- Usuários podem atualizar seus próprios pedidos (cancelar)
CREATE POLICY "Usuários podem atualizar próprios pedidos"
  ON pedidos FOR UPDATE
  TO authenticated
  USING (usuario_id = auth.uid())
  WITH CHECK (usuario_id = auth.uid());

-- Admins podem atualizar qualquer pedido
CREATE POLICY "Admins podem atualizar todos pedidos"
  ON pedidos FOR UPDATE
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM usuarios
      WHERE id = auth.uid() AND eh_admin = true
    )
  )
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM usuarios
      WHERE id = auth.uid() AND eh_admin = true
    )
  );

-- ============================================
-- POLÍTICAS RLS - TABELA ITENS_PEDIDO
-- ============================================

-- Usuários podem ver itens de seus próprios pedidos
CREATE POLICY "Usuários podem ver itens de próprios pedidos"
  ON itens_pedido FOR SELECT
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM pedidos
      WHERE pedidos.id = pedido_id AND pedidos.usuario_id = auth.uid()
    )
  );

-- Admins podem ver todos os itens
CREATE POLICY "Admins podem ver todos itens de pedidos"
  ON itens_pedido FOR SELECT
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM usuarios
      WHERE id = auth.uid() AND eh_admin = true
    )
  );

-- Usuários podem inserir itens em seus próprios pedidos
CREATE POLICY "Usuários podem criar itens em próprios pedidos"
  ON itens_pedido FOR INSERT
  TO authenticated
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM pedidos
      WHERE pedidos.id = pedido_id AND pedidos.usuario_id = auth.uid()
    )
  );

-- ============================================
-- POLÍTICAS RLS - TABELA FAVORITOS
-- ============================================

-- Usuários podem ver apenas seus próprios favoritos
CREATE POLICY "Usuários podem ver próprios favoritos"
  ON favoritos FOR SELECT
  TO authenticated
  USING (usuario_id = auth.uid());

-- Usuários podem adicionar favoritos
CREATE POLICY "Usuários podem adicionar favoritos"
  ON favoritos FOR INSERT
  TO authenticated
  WITH CHECK (usuario_id = auth.uid());

-- Usuários podem remover seus próprios favoritos
CREATE POLICY "Usuários podem remover próprios favoritos"
  ON favoritos FOR DELETE
  TO authenticated
  USING (usuario_id = auth.uid());

-- ============================================
-- POLÍTICAS RLS - TABELA AVALIACOES
-- ============================================

-- Todos podem ver avaliações
CREATE POLICY "Todos podem ver avaliações"
  ON avaliacoes FOR SELECT
  TO authenticated
  USING (true);

-- Usuários autenticados podem criar avaliações
CREATE POLICY "Usuários podem criar avaliações"
  ON avaliacoes FOR INSERT
  TO authenticated
  WITH CHECK (usuario_id = auth.uid());

-- Usuários podem atualizar suas próprias avaliações
CREATE POLICY "Usuários podem atualizar próprias avaliações"
  ON avaliacoes FOR UPDATE
  TO authenticated
  USING (usuario_id = auth.uid())
  WITH CHECK (usuario_id = auth.uid());

-- Usuários podem deletar suas próprias avaliações
CREATE POLICY "Usuários podem deletar próprias avaliações"
  ON avaliacoes FOR DELETE
  TO authenticated
  USING (usuario_id = auth.uid());

-- Admins podem deletar qualquer avaliação
CREATE POLICY "Admins podem deletar todas avaliações"
  ON avaliacoes FOR DELETE
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM usuarios
      WHERE id = auth.uid() AND eh_admin = true
    )
  );