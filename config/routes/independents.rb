namespace :independents do
  get '/own', to: 'show#own_independents'
  get '/:id', to: 'show#show'
  concerns :profile_crud
end
