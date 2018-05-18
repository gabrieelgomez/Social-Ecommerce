concern :profile_crud do
  get '/', to: 'show#index'
  put '/:id/update', to: 'update#update'
  put '/:id/destroy', to: 'destroy#destroy'
  put '/:id/restore', to: 'restore#restore'
end
