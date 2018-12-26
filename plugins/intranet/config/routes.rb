Rails.application.routes.draw do

  scope module: 'api' do
    namespace :v1 do

      # Intranet
        namespace :intranet do
          scope '/:intranet_id' do

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
                get '/', to: 'show#index'
                get '/:group_id', to: 'show#show'
                post '/create', to: 'create#create'
                put '/:group_id/update', to: 'update#update'
                delete '/:group_id/destroy', to: 'destroy#destroy'

                # memberships
                scope '/:group_id' do
                  get '/memberships', to: 'actions#set_memberships'
                  get '/memberships/:membership_id', to: 'actions#set_member'
                  put '/add_memberships', to: 'actions#add_memberships'
                  put '/delete_memberships', to: 'actions#delete_memberships'
                end
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
          # Scope intranet_id

        end
      # Intranet - end
    end
  end

end
