namespace :wallets do
  get '/my_wallets', to: 'actions#my_wallets' # Ver todas las wallets
  get '/:wallet_id', to: 'actions#wallet' # Ver una wallet del current_user
  get '/:wallet_id/transactions', to: 'transactions/transactions#wallet_transactions' # Ver todas las transactions
  get '/:wallet_id/transactions/daily', to: 'transactions/statistics#daily' # Searchs de transactions por dias
  get '/:wallet_id/transactions/monthly', to: 'transactions/statistics#monthly' # Searchs de transactions por mes
  post '/:wallet_id/add_coins/:coin_id', to: 'transactions/additions#add_coins' # Añadir puntos
  post '/:wallet_id/subtract_coins/:coin_id', to: 'transactions/subtractions#subtract_coins' # Restar o canjear puntos
end
