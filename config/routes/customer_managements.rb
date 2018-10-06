scope '/profile/:profile_id' do
  namespace :customer_managements do
    get '/', to: 'show#show'
    put '/toggle_state', to: 'state#toggle_state'
  end
end
