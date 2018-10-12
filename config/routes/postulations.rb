namespace :job_offers do
  scope '/:job_offer_id' do
    namespace :postulations do
      get '/'               , to: 'show#index'
      get '/:postulation_id', to: 'show#show'
      post '/create'        , to: 'create#create'
    end
  end
end
