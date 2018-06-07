namespace :sellers do
  get '/', to: 'show#index'
  get '/own', to: 'show#own_sellers'
  get '/:id', to: 'show#show'
  put '/current_user/update', to: 'update#update'
  put '/current_user/destroy', to: 'destroy#destroy'
  # put '/:id/restore', to: 'restore#restore'
end
