scope '/:type_profile/:profile_id' do
  namespace :job_offers do
    scope '/:job_offer_id/questions', module: :questions do
      get  '/', to: 'show#index'
      get  '/:question_id', to: 'show#show'
      post '/create', to: 'create#create'
      put  '/:question_id/update', to: 'update#update'
    end
  end
end
