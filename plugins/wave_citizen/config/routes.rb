Rails.application.routes.draw do

  scope module: 'api' do
    namespace :v1 do

      # WaveCitizen
        namespace :wave_citizen do

          # Citizens CRUD
          namespace :citizens do
            post '/create', to: 'create#create'
            get '/:citizen_id', to: 'show#show'
            get '/', to: 'show#index'
            put '/:citizen_id/update', to: 'update#update'
            delete '/:citizen_id/destroy', to: 'destroy#destroy'
          end
          # Citizens CRUD

          # Country CRUD
          namespace :countries do
            post '/create', to: 'create#create'
            get '/:country_id', to: 'show#show'
            get '/', to: 'show#index'
            put '/:country_id/update', to: 'update#update'
            delete '/:country_id/destroy', to: 'destroy#destroy'
          end
          # Country CRUD

          # TypeCandidacy CRUD
          namespace :type_candidacies do
            post '/create', to: 'create#create'
            get '/:type_candidacy_id', to: 'show#show'
            get '/', to: 'show#index'
            put '/:type_candidacy_id/update', to: 'update#update'
            delete '/:type_candidacy_id/destroy', to: 'destroy#destroy'
          end
          # TypeCandidacy CRUD

          # ProposalCategory CRUD
          namespace :proposal_categories do
            post '/create', to: 'create#create'
            get '/:proposal_category_id', to: 'show#show'
            get '/', to: 'show#index'
            put '/:proposal_category_id/update', to: 'update#update'
            delete '/:proposal_category_id/destroy', to: 'destroy#destroy'
          end
          # ProposalCategory CRUD

          # PollCategory CRUD
          namespace :poll_categories do
            post '/create', to: 'create#create'
            get '/:poll_category_id', to: 'show#show'
            get '/', to: 'show#index'
            put '/:poll_category_id/update', to: 'update#update'
            delete '/:poll_category_id/destroy', to: 'destroy#destroy'
          end
          # PollCategory CRUD

          # Proposal CRUD
          namespace :proposals do
            post '/create', to: 'create#create'
            get '/:proposal_id', to: 'show#show'
            get '/', to: 'show#index'
            put '/:proposal_id/update', to: 'update#update'
            delete '/:proposal_id/destroy', to: 'destroy#destroy'
          end
          # Proposal CRUD

          # Poll CRUD
          namespace :polls do
            post '/create', to: 'create#create'
            get '/:poll_id', to: 'show#show'
            get '/', to: 'show#index'
            put '/:poll_id/update', to: 'update#update'
            delete '/:poll_id/destroy', to: 'destroy#destroy'
          end
          # Poll CRUD

          # Item CRUD
          namespace :items do
            post '/create', to: 'create#create'
            get '/:item_id', to: 'show#show'
            get '/', to: 'show#index'
            put '/:item_id/update', to: 'update#update'
            delete '/:item_id/destroy', to: 'destroy#destroy'
          end
          # Item CRUD

          # Vote CRUD
          namespace :votes do
            post '/create', to: 'create#create'
            get '/:vote_id', to: 'show#show'
            get '/', to: 'show#index'
            put '/:vote_id/update', to: 'update#update'
            delete '/:vote_id/destroy', to: 'destroy#destroy'
          end
          # Vote CRUD

        end
      end
    end

end
