import { Link } from 'react-router-dom';
import { useCartStore } from '../stores/cartStore';
import { Trash2, Plus, Minus } from 'lucide-react';

export default function Carrinho() {
  const { items, updateQuantity, removeItem, getTotal } = useCartStore();

  if (items.length === 0) {
    return (
      <div className="max-w-4xl mx-auto px-4 py-12 text-center">
        <span className="text-6xl block mb-4">🛒</span>
        <h2 className="text-2xl font-bold text-gray-900 mb-4">
          Seu carrinho está vazio
        </h2>
        <p className="text-gray-600 mb-8">
          Adicione alguns cupcakes deliciosos ao seu carrinho!
        </p>
        <Link
          to="/"
          className="inline-block bg-pink-600 text-white px-6 py-3 rounded-lg hover:bg-pink-700 transition-colors"
        >
          Ver produtos
        </Link>
      </div>
    );
  }

  return (
    <div className="max-w-4xl mx-auto px-4 py-12">
      <h1 className="text-3xl font-bold text-gray-900 mb-8">
        Meu Carrinho
      </h1>

      <div className="bg-white rounded-lg shadow-md overflow-hidden">
        {items.map((item) => (
          <div
            key={item.id}
            className="flex items-center gap-4 p-4 border-b last:border-b-0"
          >
            <img
              src={item.imagem_url}
              alt={item.nome}
              className="w-20 h-20 object-cover rounded-lg"
            />

            <div className="flex-1">
              <h3 className="font-semibold text-gray-900">{item.nome}</h3>
              <p className="text-pink-600 font-bold">
                R$ {item.preco.toFixed(2)}
              </p>
            </div>

            <div className="flex items-center gap-3">
              <button
                onClick={() => updateQuantity(item.id, item.quantidade - 1)}
                className="p-1 rounded-full hover:bg-gray-100"
              >
                <Minus className="w-4 h-4" />
              </button>
              <span className="w-8 text-center font-medium">
                {item.quantidade}
              </span>
              <button
                onClick={() => updateQuantity(item.id, item.quantidade + 1)}
                className="p-1 rounded-full hover:bg-gray-100"
              >
                <Plus className="w-4 h-4" />
              </button>
            </div>

            <div className="text-right min-w-[80px]">
              <p className="font-bold text-gray-900">
                R$ {(item.preco * item.quantidade).toFixed(2)}
              </p>
            </div>

            <button
              onClick={() => removeItem(item.id)}
              className="p-2 text-red-600 hover:bg-red-50 rounded-lg transition-colors"
            >
              <Trash2 className="w-5 h-5" />
            </button>
          </div>
        ))}
      </div>

      <div className="mt-8 bg-white rounded-lg shadow-md p-6">
        <div className="flex justify-between items-center mb-6">
          <span className="text-xl font-semibold text-gray-900">Total</span>
          <span className="text-3xl font-bold text-pink-600">
            R$ {getTotal().toFixed(2)}
          </span>
        </div>

        <Link
          to="/checkout"
          className="block w-full bg-pink-600 text-white text-center py-3 rounded-lg hover:bg-pink-700 transition-colors font-medium"
        >
          Finalizar Pedido
        </Link>
      </div>
    </div>
  );
}
