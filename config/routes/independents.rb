namespace :independents do
  get '/own', to: 'show#own_independents'
  get '/:id', to: 'show#show'
  put '/:id/update', to: 'update#update'
  concerns :profile_crud
end
