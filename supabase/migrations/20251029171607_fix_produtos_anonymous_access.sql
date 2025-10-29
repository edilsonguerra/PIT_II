/*
  # Fix Anonymous Access to Products

  ## Overview
  Restore public access to active products for anonymous users (not logged in).
  This allows visitors to browse the catalog without authentication.

  ## Changes
  - Drop the restrictive "Produtos visíveis" policy
  - Create separate policies for anonymous and authenticated users
  - Anonymous users can see active products
  - Authenticated users can see active products OR all products if admin

  ## Security
  - Anonymous users: Read-only access to active products
  - Regular users: Read-only access to active products  
  - Admin users: Full access to all products
*/

-- Drop the restrictive policy
DROP POLICY IF EXISTS "Produtos visíveis" ON produtos;

-- Policy for anonymous users (not logged in) to see active products
CREATE POLICY "Anônimos podem ver produtos ativos"
  ON produtos FOR SELECT
  TO anon
  USING (ativo = true);

-- Policy for authenticated users to see active products OR admin sees all
CREATE POLICY "Autenticados podem ver produtos"
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
