get '/options', to: 'options/show#index'
post '/options', to: 'options/action#create'
delete '/options/:option_id/destroy', to: 'options/action#destroy'
