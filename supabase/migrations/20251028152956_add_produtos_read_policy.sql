/*
  # Adicionar política de leitura pública para produtos

  1. Mudanças
    - Adiciona política permitindo que qualquer pessoa (incluindo usuários não autenticados) possa visualizar produtos ativos
  
  2. Segurança
    - Produtos ficam visíveis publicamente para navegação no catálogo
    - Apenas leitura é permitida; inserção/atualização/exclusão continuam protegidas
*/

CREATE POLICY "Qualquer pessoa pode visualizar produtos ativos"
  ON produtos FOR SELECT
  TO anon, authenticated
  USING (ativo = true);
