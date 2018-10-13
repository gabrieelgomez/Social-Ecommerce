scope '/profiles/:profile_id' do
  scope '/job_offers/:job_offer_id', module: :job_offers do
    scope '/questions/:question_id', module: :questions do
      scope '/options', module: :q_options do
        get    '/'                  , to: 'show#index'
        post   '/create'            , to: 'create#create'
        put    '/:option_id/update' , to: 'update#update'
        delete '/:option_id/destroy', to: 'destroy#destroy'
      end
    end
  end
end
