import { createClient } from '@supabase/supabase-js';

const supabaseUrl = import.meta.env.VITE_SUPABASE_URL;
const supabaseAnonKey = import.meta.env.VITE_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseAnonKey) {
  throw new Error('Missing Supabase environment variables');
}

export const supabase = createClient(supabaseUrl, supabaseAnonKey);

export type Database = {
  public: {
    Tables: {
      produtos: {
        Row: {
          id: string;
          nome: string;
          descricao: string;
          preco: number;
          imagem_url: string;
          categoria: string;
          ativo: boolean;
          created_at: string;
        };
        Insert: Omit<Database['public']['Tables']['produtos']['Row'], 'id' | 'created_at'>;
        Update: Partial<Database['public']['Tables']['produtos']['Insert']>;
      };
      pedidos: {
        Row: {
          id: string;
          usuario_id: string;
          status: string;
          total: number;
          endereco_entrega: string;
          created_at: string;
        };
        Insert: Omit<Database['public']['Tables']['pedidos']['Row'], 'id' | 'created_at'>;
        Update: Partial<Database['public']['Tables']['pedidos']['Insert']>;
      };
      itens_pedido: {
        Row: {
          id: string;
          pedido_id: string;
          produto_id: string;
          quantidade: number;
          preco_unitario: number;
          created_at: string;
        };
        Insert: Omit<Database['public']['Tables']['itens_pedido']['Row'], 'id' | 'created_at'>;
        Update: Partial<Database['public']['Tables']['itens_pedido']['Insert']>;
      };
    };
  };
};
