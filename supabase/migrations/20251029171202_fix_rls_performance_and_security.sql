/*
  # Fix RLS Performance and Security Issues

  ## Overview
  This migration optimizes Row Level Security policies for better performance at scale
  and fixes security issues identified by Supabase.

  ## Changes Made

  ### 1. RLS Policy Performance Optimization
  All policies that use `auth.uid()` or `auth.jwt()` are now wrapped with `(select auth.uid())`
  to prevent re-evaluation for each row, significantly improving query performance at scale.

  ### 2. Function Search Path Security
  Fixed the `atualizar_timestamp()` function to have an immutable search_path for security.

  ### 3. Policy Consolidation
  Removed duplicate permissive policies to simplify access control logic:
  - Consolidated multiple SELECT policies into single policies using OR conditions
  - Consolidated multiple UPDATE/DELETE policies where appropriate

  ## Tables Affected
  - `usuarios` - 3 policies optimized
  - `produtos` - 5 policies optimized, 1 redundant policy removed
  - `pedidos` - 5 policies optimized
  - `itens_pedido` - 3 policies optimized
  - `favoritos` - 3 policies optimized
  - `avaliacoes` - 4 policies optimized

  ## Security Notes
  - All policies maintain the same security model
  - Performance improvements do not compromise data access control
  - Function search_path is now secure against SQL injection
*/

-- ============================================
-- FIX FUNCTION SEARCH PATH
-- ============================================

-- Drop and recreate the function with secure search_path (CASCADE to drop dependent triggers)
DROP FUNCTION IF EXISTS atualizar_timestamp() CASCADE;

CREATE OR REPLACE FUNCTION atualizar_timestamp()
RETURNS TRIGGER AS $$
BEGIN
  NEW.atualizado_em = now();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql SECURITY DEFINER SET search_path = public, pg_temp;

-- Recreate triggers that were dropped by CASCADE
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
-- OPTIMIZE RLS POLICIES - TABELA USUARIOS
-- ============================================

-- Drop existing policies
DROP POLICY IF EXISTS "Usuários podem ver próprio perfil" ON usuarios;
DROP POLICY IF EXISTS "Admins podem ver todos usuários" ON usuarios;
DROP POLICY IF EXISTS "Usuários podem atualizar próprio perfil" ON usuarios;

-- Consolidated SELECT policy (users see their own data OR admin sees all)
CREATE POLICY "Usuários podem ver próprio perfil"
  ON usuarios FOR SELECT
  TO authenticated
  USING (
    (select auth.uid()) = id 
    OR 
    EXISTS (
      SELECT 1 FROM usuarios
      WHERE id = (select auth.uid()) AND eh_admin = true
    )
  );

-- UPDATE policy with optimized auth check
CREATE POLICY "Usuários podem atualizar próprio perfil"
  ON usuarios FOR UPDATE
  TO authenticated
  USING ((select auth.uid()) = id)
  WITH CHECK ((select auth.uid()) = id);

-- ============================================
-- OPTIMIZE RLS POLICIES - TABELA PRODUTOS
-- ============================================

-- Drop existing policies
DROP POLICY IF EXISTS "Todos podem ver produtos ativos" ON produtos;
DROP POLICY IF EXISTS "Admins podem ver todos produtos" ON produtos;
DROP POLICY IF EXISTS "Qualquer pessoa pode visualizar produtos ativos" ON produtos;
DROP POLICY IF EXISTS "Admins podem criar produtos" ON produtos;
DROP POLICY IF EXISTS "Admins podem atualizar produtos" ON produtos;
DROP POLICY IF EXISTS "Admins podem deletar produtos" ON produtos;

-- Consolidated SELECT policy
CREATE POLICY "Produtos visíveis"
  ON produtos FOR SELECT
  TO authenticated
  USING (
    ativo = true
    OR
    EXISTS (
      SELECT 1 FROM usuarios
      WHERE id = (select auth.uid()) AND eh_admin = true
    )
  );

-- INSERT policy with optimized auth check
CREATE POLICY "Admins podem criar produtos"
  ON produtos FOR INSERT
  TO authenticated
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM usuarios
      WHERE id = (select auth.uid()) AND eh_admin = true
    )
  );

-- UPDATE policy with optimized auth check
CREATE POLICY "Admins podem atualizar produtos"
  ON produtos FOR UPDATE
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM usuarios
      WHERE id = (select auth.uid()) AND eh_admin = true
    )
  )
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM usuarios
      WHERE id = (select auth.uid()) AND eh_admin = true
    )
  );

-- DELETE policy with optimized auth check
CREATE POLICY "Admins podem deletar produtos"
  ON produtos FOR DELETE
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM usuarios
      WHERE id = (select auth.uid()) AND eh_admin = true
    )
  );

-- ============================================
-- OPTIMIZE RLS POLICIES - TABELA PEDIDOS
-- ============================================

-- Drop existing policies
DROP POLICY IF EXISTS "Usuários podem ver próprios pedidos" ON pedidos;
DROP POLICY IF EXISTS "Admins podem ver todos pedidos" ON pedidos;
DROP POLICY IF EXISTS "Usuários podem criar pedidos" ON pedidos;
DROP POLICY IF EXISTS "Usuários podem atualizar próprios pedidos" ON pedidos;
DROP POLICY IF EXISTS "Admins podem atualizar todos pedidos" ON pedidos;

-- Consolidated SELECT policy
CREATE POLICY "Ver pedidos"
  ON pedidos FOR SELECT
  TO authenticated
  USING (
    usuario_id = (select auth.uid())
    OR
    EXISTS (
      SELECT 1 FROM usuarios
      WHERE id = (select auth.uid()) AND eh_admin = true
    )
  );

-- INSERT policy with optimized auth check
CREATE POLICY "Usuários podem criar pedidos"
  ON pedidos FOR INSERT
  TO authenticated
  WITH CHECK (usuario_id = (select auth.uid()));

-- Consolidated UPDATE policy
CREATE POLICY "Atualizar pedidos"
  ON pedidos FOR UPDATE
  TO authenticated
  USING (
    usuario_id = (select auth.uid())
    OR
    EXISTS (
      SELECT 1 FROM usuarios
      WHERE id = (select auth.uid()) AND eh_admin = true
    )
  )
  WITH CHECK (
    usuario_id = (select auth.uid())
    OR
    EXISTS (
      SELECT 1 FROM usuarios
      WHERE id = (select auth.uid()) AND eh_admin = true
    )
  );

-- ============================================
-- OPTIMIZE RLS POLICIES - TABELA ITENS_PEDIDO
-- ============================================

-- Drop existing policies
DROP POLICY IF EXISTS "Usuários podem ver itens de próprios pedidos" ON itens_pedido;
DROP POLICY IF EXISTS "Admins podem ver todos itens de pedidos" ON itens_pedido;
DROP POLICY IF EXISTS "Usuários podem criar itens em próprios pedidos" ON itens_pedido;

-- Consolidated SELECT policy
CREATE POLICY "Ver itens de pedidos"
  ON itens_pedido FOR SELECT
  TO authenticated
  USING (
    EXISTS (
      SELECT 1 FROM pedidos
      WHERE pedidos.id = pedido_id AND pedidos.usuario_id = (select auth.uid())
    )
    OR
    EXISTS (
      SELECT 1 FROM usuarios
      WHERE id = (select auth.uid()) AND eh_admin = true
    )
  );

-- INSERT policy with optimized auth check
CREATE POLICY "Usuários podem criar itens em próprios pedidos"
  ON itens_pedido FOR INSERT
  TO authenticated
  WITH CHECK (
    EXISTS (
      SELECT 1 FROM pedidos
      WHERE pedidos.id = pedido_id AND pedidos.usuario_id = (select auth.uid())
    )
  );

-- ============================================
-- OPTIMIZE RLS POLICIES - TABELA FAVORITOS
-- ============================================

-- Drop existing policies
DROP POLICY IF EXISTS "Usuários podem ver próprios favoritos" ON favoritos;
DROP POLICY IF EXISTS "Usuários podem adicionar favoritos" ON favoritos;
DROP POLICY IF EXISTS "Usuários podem remover próprios favoritos" ON favoritos;

-- SELECT policy with optimized auth check
CREATE POLICY "Usuários podem ver próprios favoritos"
  ON favoritos FOR SELECT
  TO authenticated
  USING (usuario_id = (select auth.uid()));

-- INSERT policy with optimized auth check
CREATE POLICY "Usuários podem adicionar favoritos"
  ON favoritos FOR INSERT
  TO authenticated
  WITH CHECK (usuario_id = (select auth.uid()));

-- DELETE policy with optimized auth check
CREATE POLICY "Usuários podem remover próprios favoritos"
  ON favoritos FOR DELETE
  TO authenticated
  USING (usuario_id = (select auth.uid()));

-- ============================================
-- OPTIMIZE RLS POLICIES - TABELA AVALIACOES
-- ============================================

-- Drop existing policies
DROP POLICY IF EXISTS "Usuários podem criar avaliações" ON avaliacoes;
DROP POLICY IF EXISTS "Usuários podem atualizar próprias avaliações" ON avaliacoes;
DROP POLICY IF EXISTS "Usuários podem deletar próprias avaliações" ON avaliacoes;
DROP POLICY IF EXISTS "Admins podem deletar todas avaliações" ON avaliacoes;

-- INSERT policy with optimized auth check
CREATE POLICY "Usuários podem criar avaliações"
  ON avaliacoes FOR INSERT
  TO authenticated
  WITH CHECK (usuario_id = (select auth.uid()));

-- UPDATE policy with optimized auth check
CREATE POLICY "Usuários podem atualizar próprias avaliações"
  ON avaliacoes FOR UPDATE
  TO authenticated
  USING (usuario_id = (select auth.uid()))
  WITH CHECK (usuario_id = (select auth.uid()));

-- Consolidated DELETE policy
CREATE POLICY "Deletar avaliações"
  ON avaliacoes FOR DELETE
  TO authenticated
  USING (
    usuario_id = (select auth.uid())
    OR
    EXISTS (
      SELECT 1 FROM usuarios
      WHERE id = (select auth.uid()) AND eh_admin = true
    )
  );
