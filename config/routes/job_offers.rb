namespace :job_offers do
  get '/', to: 'show#index'
  get '/:job_offer_id', to: 'show#show'
  get '/complete/:job_offer_id', to: 'show#complete_job_offer'
end

scope '/profiles/:profile_id' do
  namespace :job_offers do
    get '/', to: 'show#index_per_profile'
    post '/create', to: 'create#create'
    delete '/:job_offer_id/destroy', to: 'destroy#destroy'
    put '/:job_offer_id/update', to: 'update#update'
  end
end
