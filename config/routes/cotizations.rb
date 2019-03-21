namespace :cotizations do
  post '/new', to: 'create#create'
  # get '/:cotizationable_type/:cotizationable_id', to: 'show#index'
  get '/:cotization_id', to: 'show#show'
  put '/:cotization_id/update', to: 'update#update'
  delete '/:cotization_id/destroy', to: 'destroy#destroy'


  get '/list/current_user', to: 'actions#current_user_cotizations'
end
