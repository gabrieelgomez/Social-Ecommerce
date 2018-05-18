namespace :pymes do
  get '/own', to: 'show#own_pymes'
  get '/:id', to: 'show#show'
  concerns :profile_crud
end
