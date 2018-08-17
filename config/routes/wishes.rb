# --- Wishes routes
namespace :wishes do
  get '/my_wishes', to: 'show#my_wishes'
  post '/create', to: 'create#create'
  put '/:wish_id/destroy', to: 'destroy#destroy'
  put '/:wish_id/update', to: 'update#update'
end
# --- Wishes routes - end
