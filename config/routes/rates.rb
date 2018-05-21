namespace :rates do
  post '/current_user/:profile_id', to: 'actions#create'
  delete '/current_user/:id/destroy', to: 'actions#destroy'
end
