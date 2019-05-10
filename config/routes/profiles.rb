scope module: 'profiles' do
  scope '/:type_profile' do
    get '/new', to: 'create#new'
    post '/create', to: 'create#create'
  end

  #For SocialAccounts
  scope '/:type_profile/:profile_id/social_accounts' do
    get '/show', to: 'social_accounts/social_accounts#show'
    put '/update', to: 'social_accounts/social_accounts#update'
  end

  #For Schedules
  scope '/:type_profile/:profile_id/schedules' do
    get '/show', to: 'schedules/schedules#show'
    put '/update', to: 'schedules/schedules#update'
  end
end


# --- Categories Products routes
namespace :profiles do
  get '/:profile_id/cotizations', to: 'show#profile_cotizations'
  get '/all', to: 'profiles#all_profiles'
  get '/:profile_id/products_prominent', to: 'profiles#products_prominent'
  get '/:profile_id/own_profile', to: 'profiles#own_profile'

  put '/:profile_id/change_profile_type', to: 'update#change_type_profile'

  namespace :categories do
    post '/', to: 'actions#create'
    get '/', to: 'show#index'
    get '/:category_id', to: 'show#show'
    put '/:category_id/update', to: 'actions#update'
    delete '/:category_id/destroy', to: 'actions#destroy'
    get '/products/active', to: 'categories#set_categories_products'
  end

end
# --- Categories Products routes - end
