import { Link } from 'react-router-dom';
import { ShoppingCart, User, LogOut, Package } from 'lucide-react';
import { useAuthStore } from '../stores/authStore';
import { useCartStore } from '../stores/cartStore';

export default function Navbar() {
  const { user, signOut } = useAuthStore();
  const items = useCartStore((state) => state.items);

  const itemCount = items.reduce((total, item) => total + item.quantidade, 0);

  return (
    <nav className="bg-white shadow-md sticky top-0 z-50">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="flex justify-between items-center h-16">
          <Link to="/" className="flex items-center space-x-2">
            <span className="text-2xl">☕</span>
            <span className="text-xl font-bold text-pink-600">Caramel, Coffees and Cakes</span>
          </Link>

          <div className="flex items-center space-x-6">
            <Link
              to="/carrinho"
              className="relative flex items-center space-x-1 text-gray-700 hover:text-pink-600 transition-colors"
            >
              <ShoppingCart className="w-5 h-5" />
              {itemCount > 0 && (
                <span className="absolute -top-2 -right-2 bg-pink-600 text-white text-xs rounded-full w-5 h-5 flex items-center justify-center">
                  {itemCount}
                </span>
              )}
            </Link>

            {user ? (
              <>
                <Link
                  to="/meus-pedidos"
                  className="flex items-center space-x-1 text-gray-700 hover:text-pink-600 transition-colors"
                >
                  <Package className="w-5 h-5" />
                  <span className="hidden sm:inline">Pedidos</span>
                </Link>
                <button
                  onClick={() => signOut()}
                  className="flex items-center space-x-1 text-gray-700 hover:text-pink-600 transition-colors"
                >
                  <LogOut className="w-5 h-5" />
                  <span className="hidden sm:inline">Sair</span>
                </button>
              </>
            ) : (
              <Link
                to="/login"
                className="flex items-center space-x-1 text-gray-700 hover:text-pink-600 transition-colors"
              >
                <User className="w-5 h-5" />
                <span className="hidden sm:inline">Entrar</span>
              </Link>
            )}
          </div>
        </div>
      </div>
    </nav>
  );
}
