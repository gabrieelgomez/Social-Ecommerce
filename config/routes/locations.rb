namespace :locations do
  scope '/:locatable_type/:locatable_id' do
    post '/create', to: 'create#create'
  end
end
