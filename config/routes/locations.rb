namespace :locations do
  scope '/:locatable_type/:locatable_id' do
    post '/create', to: 'create#create'
    put '/:location_id/update', to: 'update#update'
    get '/', to: 'show#show'
  end
  get '/all', to: 'show#index'
end
