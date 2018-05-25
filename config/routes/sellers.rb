namespace :sellers do
  get '/own', to: 'show#own_sellers'
  get '/:id', to: 'show#show'
  concerns :profile_crud
end
