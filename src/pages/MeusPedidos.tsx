import { useEffect, useState } from 'react';
import { supabase } from '../lib/supabase';
import { useAuthStore } from '../stores/authStore';
import { Package } from 'lucide-react';

interface Pedido {
  id: string;
  status: string;
  total: number;
  endereco_entrega: string;
  created_at: string;
  itens_pedido: {
    quantidade: number;
    preco_unitario: number;
    produtos: {
      nome: string;
    };
  }[];
}

export default function MeusPedidos() {
  const [pedidos, setPedidos] = useState<Pedido[]>([]);
  const [loading, setLoading] = useState(true);
  const { user } = useAuthStore();

  useEffect(() => {
    loadPedidos();
  }, []);

  async function loadPedidos() {
    try {
      const { data, error } = await supabase
        .from('pedidos')
        .select(
          `
          *,
          itens_pedido (
            quantidade,
            preco_unitario,
            produtos (
              nome
            )
          )
        `
        )
        .eq('usuario_id', user!.id)
        .order('created_at', { ascending: false });

      if (error) throw error;
      setPedidos(data || []);
    } catch (error) {
      console.error('Erro ao carregar pedidos:', error);
    } finally {
      setLoading(false);
    }
  }

  const getStatusColor = (status: string) => {
    switch (status) {
      case 'pendente':
        return 'bg-yellow-100 text-yellow-800';
      case 'em_preparacao':
        return 'bg-blue-100 text-blue-800';
      case 'enviado':
        return 'bg-purple-100 text-purple-800';
      case 'entregue':
        return 'bg-green-100 text-green-800';
      case 'cancelado':
        return 'bg-red-100 text-red-800';
      default:
        return 'bg-gray-100 text-gray-800';
    }
  };

  const getStatusText = (status: string) => {
    switch (status) {
      case 'pendente':
        return 'Pendente';
      case 'em_preparacao':
        return 'Em Preparação';
      case 'enviado':
        return 'Enviado';
      case 'entregue':
        return 'Entregue';
      case 'cancelado':
        return 'Cancelado';
      default:
        return status;
    }
  };

  if (loading) {
    return (
      <div className="max-w-4xl mx-auto px-4 py-12 text-center">
        <p className="text-gray-600">Carregando pedidos...</p>
      </div>
    );
  }

  if (pedidos.length === 0) {
    return (
      <div className="max-w-4xl mx-auto px-4 py-12 text-center">
        <Package className="w-16 h-16 mx-auto text-gray-400 mb-4" />
        <h2 className="text-2xl font-bold text-gray-900 mb-4">
          Nenhum pedido encontrado
        </h2>
        <p className="text-gray-600">
          Você ainda não fez nenhum pedido. Que tal começar agora?
        </p>
      </div>
    );
  }

  return (
    <div className="max-w-4xl mx-auto px-4 py-12">
      <h1 className="text-3xl font-bold text-gray-900 mb-8">Meus Pedidos</h1>

      <div className="space-y-6">
        {pedidos.map((pedido) => (
          <div
            key={pedido.id}
            className="bg-white rounded-lg shadow-md overflow-hidden"
          >
            <div className="p-6">
              <div className="flex justify-between items-start mb-4">
                <div>
                  <p className="text-sm text-gray-600">
                    Pedido #{pedido.id.slice(0, 8)}
                  </p>
                  <p className="text-sm text-gray-600">
                    {new Date(pedido.created_at).toLocaleDateString('pt-BR', {
                      day: '2-digit',
                      month: '2-digit',
                      year: 'numeric',
                      hour: '2-digit',
                      minute: '2-digit',
                    })}
                  </p>
                </div>
                <span
                  className={`px-3 py-1 rounded-full text-sm font-medium ${getStatusColor(
                    pedido.status
                  )}`}
                >
                  {getStatusText(pedido.status)}
                </span>
              </div>

              <div className="mb-4">
                <h3 className="font-semibold text-gray-900 mb-2">Itens:</h3>
                <ul className="space-y-1">
                  {pedido.itens_pedido.map((item, index) => (
                    <li key={index} className="text-sm text-gray-700">
                      {item.quantidade}x {item.produtos.nome} - R${' '}
                      {(item.preco_unitario * item.quantidade).toFixed(2)}
                    </li>
                  ))}
                </ul>
              </div>

              <div className="mb-4">
                <h3 className="font-semibold text-gray-900 mb-1">
                  Endereço de Entrega:
                </h3>
                <p className="text-sm text-gray-700">
                  {pedido.endereco_entrega}
                </p>
              </div>

              <div className="flex justify-between items-center pt-4 border-t">
                <span className="font-semibold text-gray-900">Total</span>
                <span className="text-xl font-bold text-pink-600">
                  R$ {pedido.total.toFixed(2)}
                </span>
              </div>
            </div>
          </div>
        ))}
      </div>
    </div>
  );
}
