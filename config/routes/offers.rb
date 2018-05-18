scope '/:type_profile/:profile_id' do
  namespace :offers do
    post '/', to: 'create#create'
  end
end

namespace :offers do
  get '/current_user', to: 'show#current_user_offers'
  get '/', to: 'show#index'
  get '/:username', to: 'show#user_offers'
  get '/:id', to: 'show#show'
  put '/:id/update', to: 'update#update'
  delete '/:id/destroy', to: 'destroy#destroy'
end
