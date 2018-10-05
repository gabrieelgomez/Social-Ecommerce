namespace :statistics do

  namespace :profiles do
    get '/:profile_id', to: 'general#statistics'
    get '/:profile_id/daily', to: 'daily#statistics'
    get '/:profile_id/monthly', to: 'monthly#statistics'
  end

end
