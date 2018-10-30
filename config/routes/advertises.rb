namespace :advertises do
  get  '/',                     to: 'show#index'
  get  '/:advertise_id',        to: 'show#show'
  post '/create',               to: 'create#create'
  put  '/:advertise_id/update', to: 'update#update'
  put  '/:advertise_id/click_user', to: 'update#add_click_user'
  put  '/:advertise_id/increase_seen', to: 'update#increase_seen'
end
