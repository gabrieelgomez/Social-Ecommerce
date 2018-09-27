namespace :statistics do

  namespace :profiles do
    get '/:profile_id', to: 'actions#statistics'
  end

end
