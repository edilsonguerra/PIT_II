import { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { useCartStore } from '../stores/cartStore';
import { useAuthStore } from '../stores/authStore';
import { supabase } from '../lib/supabase';

export default function Checkout() {
  const [endereco, setEndereco] = useState('');
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const { items, getTotal, clearCart } = useCartStore();
  const { user } = useAuthStore();
  const navigate = useNavigate();

  async function handleSubmit(e: React.FormEvent) {
    e.preventDefault();
    setError('');
    setLoading(true);

    try {
      const { data: pedido, error: pedidoError } = await supabase
        .from('pedidos')
        .insert({
          usuario_id: user!.id,
          status: 'pendente',
          total: getTotal(),
          endereco_entrega: endereco,
        })
        .select()
        .single();

      if (pedidoError) throw pedidoError;

      const itens = items.map((item) => ({
        pedido_id: pedido.id,
        produto_id: item.id,
        quantidade: item.quantidade,
        preco_unitario: item.preco,
      }));

      const { error: itensError } = await supabase
        .from('itens_pedido')
        .insert(itens);

      if (itensError) throw itensError;

      clearCart();
      navigate('/meus-pedidos');
    } catch (err) {
      console.error('Erro ao criar pedido:', err);
      setError('Erro ao finalizar pedido. Tente novamente.');
      setLoading(false);
    }
  }

  if (items.length === 0) {
    navigate('/carrinho');
    return null;
  }

  return (
    <div className="max-w-2xl mx-auto px-4 py-12">
      <h1 className="text-3xl font-bold text-gray-900 mb-8">
        Finalizar Pedido
      </h1>

      <div className="bg-white rounded-lg shadow-md p-6 mb-6">
        <h2 className="text-xl font-semibold mb-4">Resumo do Pedido</h2>
        {items.map((item) => (
          <div
            key={item.id}
            className="flex justify-between items-center py-2 border-b"
          >
            <span className="text-gray-700">
              {item.quantidade}x {item.nome}
            </span>
            <span className="font-semibold">
              R$ {(item.preco * item.quantidade).toFixed(2)}
            </span>
          </div>
        ))}
        <div className="flex justify-between items-center pt-4 text-xl font-bold">
          <span>Total</span>
          <span className="text-pink-600">R$ {getTotal().toFixed(2)}</span>
        </div>
      </div>

      <form onSubmit={handleSubmit} className="bg-white rounded-lg shadow-md p-6">
        <h2 className="text-xl font-semibold mb-4">Endereço de Entrega</h2>

        {error && (
          <div className="bg-red-50 text-red-600 px-4 py-3 rounded-lg text-sm mb-4">
            {error}
          </div>
        )}

        <div className="mb-6">
          <label
            htmlFor="endereco"
            className="block text-sm font-medium text-gray-700 mb-2"
          >
            Endereço Completo
          </label>
          <textarea
            id="endereco"
            required
            rows={4}
            value={endereco}
            onChange={(e) => setEndereco(e.target.value)}
            className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-pink-500 focus:border-transparent"
            placeholder="Rua, número, bairro, cidade, estado, CEP"
          />
        </div>

        <button
          type="submit"
          disabled={loading}
          className="w-full bg-pink-600 text-white py-3 rounded-lg hover:bg-pink-700 transition-colors disabled:opacity-50 disabled:cursor-not-allowed font-medium"
        >
          {loading ? 'Processando...' : 'Confirmar Pedido'}
        </button>
      </form>
    </div>
  );
}
