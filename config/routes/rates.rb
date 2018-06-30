namespace :rates do
  post '/current_user/:rateable_type/:rateable_id', to: 'actions#create'
  delete '/current_user/:rateable_type/:rateable_id/destroy', to: 'actions#destroy'
end
