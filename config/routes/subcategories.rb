namespace :products do
  namespace :subcategories do
    post '/', to: 'action#create'
    get '/', to: 'show#index'
    get '/:subcategory_id', to: 'show#show'
    put '/:subcategory_id/update', to: 'action#update'
    delete '/:subcategory_id/destroy', to: 'action#destroy'
  end
end
