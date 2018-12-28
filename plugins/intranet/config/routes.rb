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
                get '/', to: 'show#index'
                get '/:board_id', to: 'show#show'
                get '/create', to: 'create#create'
                put '/:board_id/update', to: 'update#update'
                delete '/:board_id/destroy', to: 'destroy#destroy'
              end
            # Boards - end

            # Lists
              namespace :lists do
                get '/', to: 'show#index'
                get '/:list_id', to: 'show#show'
                get '/create', to: 'create#create'
                put '/:list_id/update', to: 'update#update'
                delete '/:list_id/destroy', to: 'destroy#destroy'
              end
            # Lists - end

            # Cards
              namespace :cards do
                get '/', to: 'show#index'
                get '/:card_id', to: 'show#show'
                get '/create', to: 'create#create'
                put '/:card_id/update', to: 'update#update'
                delete '/:card_id/destroy', to: 'destroy#destroy'
              end
            # Cards - end

            # checklists
              namespace :checklists do
                get '/', to: 'show#index'
                get '/:checklist_id', to: 'show#show'
                get '/create', to: 'create#create'
                put '/:checklist_id/update', to: 'update#update'
                delete '/:checklist_id/destroy', to: 'destroy#destroy'
              end
            # checklists - end

            # Tasks
              namespace :tasks do
                get '/', to: 'show#index'
                get '/:task_id', to: 'show#show'
                get '/create', to: 'create#create'
                put '/:task_id/update', to: 'update#update'
                delete '/:task_id/destroy', to: 'destroy#destroy'
              end
            # Tasks - end

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

          end
          # Scope intranet_id

        end
      # Intranet - end
    end
  end

end
