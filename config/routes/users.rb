namespace :users do
  get '/current', to: 'show#profile'
  get '/', to: 'show#index'
  get '/current', to: 'show#get_current_user'
  get '/:id', to: 'show#show'
end
