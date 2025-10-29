import { useEffect, useState } from 'react';
import { supabase } from '../lib/supabase';
import { useCartStore } from '../stores/cartStore';
import { ShoppingCart } from 'lucide-react';

interface Produto {
  id: string;
  nome: string;
  descricao: string;
  preco: number;
  imagem_url: string;
  categoria: string;
  ativo: boolean;
}

export default function Home() {
  const [produtos, setProdutos] = useState<Produto[]>([]);
  const [loading, setLoading] = useState(true);
  const [selectedCategory, setSelectedCategory] = useState<string>('todos');
  const addItem = useCartStore((state) => state.addItem);

  useEffect(() => {
    loadProdutos();
  }, []);

  async function loadProdutos() {
    try {
      const { data, error } = await supabase
        .from('produtos')
        .select('*')
        .eq('ativo', true)
        .order('nome');

      if (error) throw error;
      setProdutos(data || []);
    } catch (error) {
      console.error('Erro ao carregar produtos:', error);
    } finally {
      setLoading(false);
    }
  }

  const categorias = ['todos', ...new Set(produtos.map((p) => p.categoria))];
  const produtosFiltrados =
    selectedCategory === 'todos'
      ? produtos
      : produtos.filter((p) => p.categoria === selectedCategory);

  if (loading) {
    return (
      <div className="max-w-7xl mx-auto px-4 py-12 text-center">
        <p className="text-gray-600">Carregando produtos...</p>
      </div>
    );
  }

  return (
    <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
      <div className="text-center mb-12">
        <h1 className="text-4xl font-bold text-gray-900 mb-4">
          Bem-vindo ao Caramel, Coffees and Cakes
        </h1>
        <p className="text-lg text-gray-600 max-w-2xl mx-auto">
          Deliciosos cafés, doces e cupcakes artesanais feitos com amor e ingredientes de
          qualidade. Peça agora e receba em casa!
        </p>
      </div>

      <div className="flex flex-wrap gap-2 justify-center mb-8">
        {categorias.map((cat) => (
          <button
            key={cat}
            onClick={() => setSelectedCategory(cat)}
            className={`px-4 py-2 rounded-full font-medium transition-colors ${
              selectedCategory === cat
                ? 'bg-pink-600 text-white'
                : 'bg-gray-200 text-gray-700 hover:bg-gray-300'
            }`}
          >
            {cat.charAt(0).toUpperCase() + cat.slice(1)}
          </button>
        ))}
      </div>

      {produtosFiltrados.length === 0 ? (
        <div className="text-center py-12">
          <p className="text-gray-600">
            Nenhum produto disponível no momento.
          </p>
        </div>
      ) : (
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
          {produtosFiltrados.map((produto) => (
            <div
              key={produto.id}
              className="bg-white rounded-lg shadow-md overflow-hidden hover:shadow-xl transition-shadow"
            >
              <img
                src={produto.imagem_url}
                alt={produto.nome}
                className="w-full h-48 object-cover"
              />
              <div className="p-4">
                <h3 className="text-lg font-semibold text-gray-900 mb-2">
                  {produto.nome}
                </h3>
                <p className="text-sm text-gray-600 mb-3 line-clamp-2">
                  {produto.descricao}
                </p>
                <div className="flex items-center justify-between">
                  <span className="text-2xl font-bold text-pink-600">
                    R$ {produto.preco.toFixed(2)}
                  </span>
                  <button
                    onClick={() => addItem(produto)}
                    className="bg-pink-600 text-white px-4 py-2 rounded-lg hover:bg-pink-700 transition-colors flex items-center space-x-2"
                  >
                    <ShoppingCart className="w-4 h-4" />
                    <span>Adicionar</span>
                  </button>
                </div>
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  );
}
