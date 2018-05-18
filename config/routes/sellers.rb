namespace :sellers do
  get '/own', to: 'show#own_sellers'
  concerns :profile_crud
end
