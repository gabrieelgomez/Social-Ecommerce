resources :profiles do
  resources :job_offers, module: :job_offers do
    resources :questions, module: :questions do
      nested do
        scope '/options', module: :q_options do
          get    '/'                  , to: 'show#index'
          post   '/create'            , to: 'create#create'
          put    '/:option_id/update' , to: 'update#update'
          delete '/:option_id/destroy', to: 'destroy#destroy'
        end
      end
    end
  end
end
