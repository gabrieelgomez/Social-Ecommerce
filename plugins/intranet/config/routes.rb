Rails.application.routes.draw do

  scope module: 'api' do
    namespace :v1 do

      # Intranet
        namespace :intranet do

          # Actions
            namespace :actions do
              get '/create', to: 'create#create'
            end
          # Actions - end

          # Boards
            namespace :boards do
              get '/create', to: 'create#create'
            end
          # Boards - end

          # Groups
            namespace :groups do
              get '/create', to: 'create#create'
            end
          # Groups - end

          # Notifications
            namespace :notifications do
              get '/create', to: 'create#create'
            end
          # Notifications - end

          # Resources
            namespace :resources do
              get '/create', to: 'create#create'
            end
          # Resources - end

          # Tasks
            namespace :tasks do
              get '/create', to: 'create#create'
            end
          # Tasks - end


        end
      # Intranet - end
    end
  end

end
