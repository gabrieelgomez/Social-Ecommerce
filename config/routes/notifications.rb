namespace :notifications do

  # # --- Users Following routes
  # namespace :users do
  #   #Crear seguidor
  #   get '/follow/:user_id', to: 'action#create_follow'
  #   #Listar todos los seguidores de current_v1_user
  #   get '/all/notifications', to: 'action#notifications'
  #   #Listar los que sigue current_v1_user
  #   get '/all/following', to: 'action#following'
  #   #Dejar de seguir un usuario a partir de current_v1_user
  #   post '/stop/unfollow', to: 'action#unfollow'
  # end


  #Listar todas las notificaciones leídas o no leidas de current_v1_user
  get '/all', to: 'show#all'

  #Marcar como leída o no leída
  get '/:notification_id/:mark', to: 'show#mark_notification'

  #Ver listado de las configuraciones
  get '/settings', to: 'settings#show'

  #Editar Setting
  post '/settings/update', to: 'settings#update'

end
