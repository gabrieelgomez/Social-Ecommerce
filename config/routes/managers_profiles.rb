namespace :managers_profiles do
  # Rol Assign
  post 'create_rol', to: 'actions#create_rol'

  get 'search_user', to: 'actions#search_user'

end
