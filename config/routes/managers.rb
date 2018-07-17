namespace :managers do
  # Stadistics
  get '/category_products', to: 'stadistic#category_products'
  get '/subcategory_products', to: 'stadistic#subcategory_products'

  get '/get_profiles', to: 'profiles#get_profiles'
  get '/get_users', to: 'users#get_users'

  post '/profiles/:profile_id/validate/:val_number', to: 'profiles#set_profile_validation'
  post '/users/:nickname/:censorship', to: 'users#censorship'
  post '/profiles/:profile_id/:censorship', to: 'profiles#censorship'

  post '/send_diffusion', to: 'users#diffusion'

end
