namespace :posts do
  post '/create', to: 'create#create'
  get '/', to: 'show#index'
  get '/:post_id', to: 'show#show'
  delete '/:post_id/destroy', to: 'destroy#destroy'
end
