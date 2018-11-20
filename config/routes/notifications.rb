namespace :notifications do

  # # ---Notifications Admin
  namespace :admin do
    post 'create', to: 'admin#create'
    get 'show', to: 'admin#show'
    delete '/:notification_id/destroy', to: 'admin#destroy'
    post 'send_notifications/:notification_id', to: 'users#send_notifications'
  end


  #Listar todas las notificaciones leídas o no leidas de current_v1_user
  get '/all', to: 'show#all'

  #Marcar como leída o no leída
  get '/:notification_id/:mark', to: 'show#mark_notification'

  #Ver listado de las configuraciones
  get '/settings', to: 'settings#show'

  #Editar Setting
  post '/settings/update', to: 'settings#update'

end
