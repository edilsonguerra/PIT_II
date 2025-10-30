# Security Configuration

## Database Security

### Row Level Security (RLS)
All tables have RLS enabled with optimized policies for performance and security.

### Indexes
The following indexes are created for query optimization. They may show as "unused" in development but are critical for production performance:

- `idx_pedidos_usuario` - Optimizes user order queries
- `idx_pedidos_status` - Optimizes order status filtering
- `idx_itens_pedido_pedido` - Optimizes order items lookup
- `idx_itens_pedido_produto` - Optimizes product references in orders
- `idx_favoritos_usuario` - Optimizes user favorites queries
- `idx_favoritos_produto` - Optimizes product favorites lookup
- `idx_avaliacoes_produto` - Optimizes product reviews display
- `idx_avaliacoes_usuario` - Optimizes user reviews queries

**Do not remove these indexes** - they will be utilized as data volume grows.

## Authentication Security

### Leaked Password Protection

To enable protection against compromised passwords:

1. Go to your Supabase Dashboard
2. Navigate to **Authentication** > **Providers**
3. Click on **Email**
4. Scroll to **Security Settings**
5. Enable **"Prevent use of compromised passwords"**

This feature checks passwords against the HaveIBeenPwned database to prevent users from using passwords that have been exposed in data breaches.

### Additional Security Recommendations

1. **Enable MFA** for admin accounts
2. **Set strong password requirements** in Authentication settings
3. **Configure email verification** if needed for your use case
4. **Set up rate limiting** for API endpoints
5. **Review RLS policies** regularly as features are added
