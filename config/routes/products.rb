namespace :products do
  get '/own', to: 'show#show_own'
  get '/search', to: 'show#search_tag'
  get '/', to: 'show#index'
  get '/:id', to: 'show#show'
  put '/:id/destroy', to: 'action#destroy'
  post '/', to: 'action#create'
  put '/:id/update', to: 'action#update'
  put '/:id/update/status', to: 'action#update_status'
end

scope module: 'products' do
  get '/wished_products', to: 'show#wished_products'
end


# resources :products, only: [:create, :update], controller: 'products/action'
# resources :products, only: [:index, :show], controller: 'products/show'
