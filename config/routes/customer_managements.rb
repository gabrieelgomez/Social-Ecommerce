scope '/profile/:profile_id' do
  namespace :customer_managements do
    get '/', to: 'show#show'
  end
end
