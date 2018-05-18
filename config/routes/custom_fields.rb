get '/custom_fields', to: 'custom_fields/show#index'
post '/custom_fields', to: 'custom_fields/action#create'
delete '/custom_fields/:field_id/destroy', to: 'custom_fields/action#destroy'
