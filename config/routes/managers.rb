namespace :managers do
  post '/users/:nickname/:censorship', to: 'users#censorship'
  post '/profiles/:profile_id/:censorship', to: 'profiles#censorship'
end
