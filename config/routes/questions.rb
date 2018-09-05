scope '/:type_profile/:profile_id' do
  namespace :job_offers do
    scope '/questions/:question_id', module: :questions do
      get '/', to: 'show#index_per_profile'
      # post '/create', to: 'create#create'
      # delete '/:job_offer_id/destroy', to: 'destroy#destroy'
      # put '/:job_offer_id/update', to: 'update#update'
    end
  end
end
