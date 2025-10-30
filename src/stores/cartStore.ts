import { create } from 'zustand';
import { persist } from 'zustand/middleware';

export interface CartItem {
  id: string;
  nome: string;
  preco: number;
  imagem_url: string;
  quantidade: number;
}

interface CartState {
  items: CartItem[];
  addItem: (item: Omit<CartItem, 'quantidade'>) => void;
  removeItem: (id: string) => void;
  updateQuantity: (id: string, quantidade: number) => void;
  clearCart: () => void;
  getTotal: () => number;
}

export const useCartStore = create<CartState>()(
  persist(
    (set, get) => ({
      items: [],

      addItem: (item) => {
        const items = get().items;
        const existingItem = items.find((i) => i.id === item.id);

        if (existingItem) {
          set({
            items: items.map((i) =>
              i.id === item.id ? { ...i, quantidade: i.quantidade + 1 } : i
            ),
          });
        } else {
          set({ items: [...items, { ...item, quantidade: 1 }] });
        }
      },

      removeItem: (id) => {
        set({ items: get().items.filter((i) => i.id !== id) });
      },

      updateQuantity: (id, quantidade) => {
        if (quantidade <= 0) {
          get().removeItem(id);
        } else {
          set({
            items: get().items.map((i) =>
              i.id === id ? { ...i, quantidade } : i
            ),
          });
        }
      },

      clearCart: () => {
        set({ items: [] });
      },

      getTotal: () => {
        return get().items.reduce(
          (total, item) => total + item.preco * item.quantidade,
          0
        );
      },
    }),
    {
      name: 'cart-storage',
    }
  )
);
