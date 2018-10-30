namespace :users do
  #For EducationalDescriptions
  namespace :educational_descriptions do
    post '/create', to: 'educational_descriptions#create'
    get '/index', to: 'educational_descriptions#index'
    get '/show/:educational_id', to: 'educational_descriptions#show'
    put '/update/:educational_id', to: 'educational_descriptions#update'
    put '/destroy/:educational_id', to: 'educational_descriptions#destroy'
  end
end
