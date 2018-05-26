namespace :products do
  get '/own', to: 'show#show_own'
  get '/search', to: 'show#search_tag'
  get '/all', to: 'show#all'
  get '/', to: 'show#index'
  get '/:id', to: 'show#show'
  put '/:id/destroy', to: 'action#destroy'
  post '/', to: 'action#create'
  put '/:id', to: 'action#update'
end

# resources :products, only: [:create, :update], controller: 'products/action'
# resources :products, only: [:index, :show], controller: 'products/show'