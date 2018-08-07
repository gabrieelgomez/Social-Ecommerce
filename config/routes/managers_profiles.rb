namespace :managers_profiles do
  # Rol Assign

  #Asignar o remover rolesm type_Action: add_role or remove_role
  post '/:type_action', to: 'actions#create_or_remove_rol'

  #Buscar usuarios por correo
  get 'search_user', to: 'actions#search_user'

  #Ver mis profiles asignados y roles
  get 'assigned', to: 'actions#my_assigned'

  #Ver los usuarios asignados de un profile
  get 'users_assigned_to_profile', to: 'actions#users_assigned_to_profile'
end
