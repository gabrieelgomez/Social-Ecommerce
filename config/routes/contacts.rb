namespace :contacts do
  get '/', to: 'show#index'
  post '/create', to: 'create#create'
  put '/:id/update', to: 'update#update'
  delete '/:id/destroy', to: 'destroy#destroy'
end
