namespace :users do
  get '/rate_to_profiles', to: 'general#raiting'
  get '/filters_cotizations', to: 'general#filters_cotizations'
  get '/current', to: 'show#profile'
  get '/', to: 'show#index'
  get '/current', to: 'show#get_current_user'
  get '/:id', to: 'show#show'
  post 'omniauth/:provider', to: 'omniauth#create_or_find'
  get 'validates/nickname', to: 'general#validate_nickname'
  put 'update/nickname', to: 'general#update_nickname'

  post '/create', to: 'create#create'
  put '/:user_id/update', to: 'update#update'
  delete '/:user_id/destroy', to: 'destroy#destroy'
end
