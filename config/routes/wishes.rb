# --- Wishes routes
namespace :wishes do
  get '/my_wishes', to: 'show#my_wishes'
  get '/:user_id/products', to: 'show#wishes_by_user'
  post '/create', to: 'create#create'
  put '/:wish_id/destroy', to: 'destroy#destroy'
  put '/:wish_id/update', to: 'update#update'
  get '/products/:product_id', to: 'show#wished_products'
end
# --- Wishes routes - end
