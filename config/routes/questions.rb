scope '/profiles/:profile_id' do
  namespace :job_offers do
    scope '/:job_offer_id' do
      scope '/questions', module: :questions do
        get     '/', to: 'show#index'
        get     '/:question_id', to: 'show#show'
        post    '/create', to: 'create#create'
        put     '/:question_id/update', to: 'update#update'
        delete  '/:question_id/destroy', to: 'destroy#destroy'
      end
    end
  end
end
