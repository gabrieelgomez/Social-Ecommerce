namespace :users do
  get '/rate_to_profiles', to: 'general#raiting'
  get '/filters_cotizations', to: 'general#filters_cotizations'
  get '/current', to: 'show#profile'
  get '/', to: 'show#index'
  get '/current', to: 'show#get_current_user'
  get '/:id', to: 'show#show'
  post 'omniauth/:provider', to: 'omniauth#create_or_find'
end
