namespace :products do
  get '/:profile_id/subcategories/enabled', to: 'show#subcat_enabled'
  namespace :subcategories do
    post '/', to: 'action#create'
    get '/', to: 'show#index'
    get '/:subcategory_id', to: 'show#show'
    put '/:subcategory_id/update', to: 'action#update'
    delete '/:subcategory_id/destroy', to: 'action#destroy'
  end
end

scope module: 'products' do
  namespace :subcategories do
    get '/:subcategory_id/products', to: 'show#subcat_products'
  end
end
