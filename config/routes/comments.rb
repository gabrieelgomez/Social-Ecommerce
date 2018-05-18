namespace :comments do
  post '/new', to: 'create#create'
  get '/:type_profile/:profile_id', to: 'show#index'
  get '/:comment_id', to: 'show#show'
  put '/:comment_id/update', to: 'update#update'
  delete '/:comment_id/destroy', to: 'destroy#destroy'
end
