namespace :likes do
  post '/new', to: 'create#create'
  post '/unliked', to: 'destroy#destroy'
end
