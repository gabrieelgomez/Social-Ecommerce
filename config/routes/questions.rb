resources :profiles do
  resources :job_offers, module: :job_offers do
    nested do
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
