namespace :sellers do
  get '/own', to: 'show#own_sellers'
  get '/:id', to: 'show#show'
  put '/current_user/update', to: 'update#update'
  put '/current_user/destroy', to: 'destroy#destroy'
  # concerns :profile_crud
end
