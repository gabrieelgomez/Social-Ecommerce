scope module: 'followers' do

  # --- Users Following routes
  namespace :users do
    #Crear seguidor
    get '/follow/:user_id', to: 'action#create_follow'
    #Listar todos los seguidores de current_v1_user
    get '/all/followers', to: 'action#followers'
    #Listar los que sigue current_v1_user
    get '/all/following', to: 'action#following'
    #Dejar de seguir un usuario a partir de current_v1_user
    post '/stop/unfollow', to: 'action#unfollow'
  end

  # /current_user/following/seller

  # --- Profiles Following routes
  # namespace :profiles do
  scope module: 'profiles' do
    #Crear seguidor
    get 'current_user/follow/:type_profile/:profile_id', to: 'action#create_follow'
    #Listar todos los seguidores de current_v1_profile
    get 'current_user/followers/:type_profile/:profile_id', to: 'action#followers'
    #Listar los que sigue current_v1_profile
    get 'current_user/following/:type_profile', to: 'action#following'
    #Dejar de seguir un usuario a partir de current_v1_profile
    post 'current_user/unfollow/:type_profile/:profile_id/', to: 'action#unfollow'

    #Conocer si has seguido a un profile
    get 'profiles/:type_profile/:profile_id/followed', to: 'action#followed'

  end

end
